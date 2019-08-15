require 'line/bot'

class LinebotController < ApplicationController
  protect_from_forgery :except => [:callback]

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end
    events = client.parse_events_from(body)
    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          if event.message['text'] =~ /購入_(\d+)/
            if Product.find($1).number > 0
              line_id = event['source']['userId']
              user_id = User.find_by(line_id: line_id).id
              product_id = Product.find($1).id
              @number_purchase = NumberPurchase.new(user_id: user_id, product_id: product_id, number: 1)
              if @number_purchase.save!
                @number_purchase.product.update_attribute(:number, @number_purchase.product.number - 1)
              end
              message = {
                type: 'text',
                text: "ご注文ありがとうございます。\n現在予約状態です。\n確定されるまで今しばらくお待ち下さい。"
              }
            else
              message = {
                type: 'text',
                text: "この度はご注文いただきまして、誠にありがとうございます。\n大変申し訳ございませんが、売切となりました。\nまたのご利用をお待ちしております。"
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'].eql?('プロフィール')
            client.reply_message(event['replyToken'], user_action_confirm)
          elsif event.message['text'].eql?('パン屋お気に入り')
            message = {
              type: 'text',
              text: "パン屋お気に入り届いた"
            }
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'].eql?("'onopanマニュアル")
            message = {
              type: 'text',
              text: "'onopanマニュアル届いた"
            }
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'].eql?('プロフィール削除')
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            user.destroy
            message = {
              type: 'text',
              text: 'プロフィール情報を削除しました。'
            }
            client.reply_message(event['replyToken'], message)
          end
        end
      end
    }

    head :ok
  end

  private

  def user_action_confirm
    {
      "type": "template",
      "altText": "This is a buttons template",
      "template": {
          "type": "buttons",
          "text": "プロフィールに対しての操作を下記から選んで下さい",
          "defaultAction": {
              "type": "uri",
              "label": "View detail",
              "uri": "http://example.com/page/123"
          },
          "actions": [
              {
              "type": "uri",
              "label": "作成",
              "uri": "line://app/1599048461-KY1Q2QM8"
              },
              {
                "type": "uri",
                "label": "編集",
                "uri": "http://example.com/page/123"
                #collectionで作って、usercreate,そのlineIDとりだし、destroy、そして変数だけ使ってUser.find_by(line_id: line_id)。そんでedit
              },
              {
                "type": "message",
                "label": "削除",
                "text": "プロフィール削除"
                #削除するというメッセージを送って、またcollbackでうけとって、if文で処理して、削除する。
              }
          ]
      }
    }
  end
end
