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
              number_purchase = NumberPurchase.new(user_id: user_id, product_id: product_id, number: 1)
              if number_purchase.save!
                number_purchase.product.update_attribute(:number, number_purchase.product.number - 1)
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
          elsif event.message['text'] =~ /.*のお気に入り解除_(\d+)/
            line_id = event['source']['userId']
            user_id = User.find_by(line_id: line_id).id
            store = Store.find($1)
            relationship = Relationship.find_by(user_id: user_id, store_id: store.id)
            if relationship
              if relationship.destroy
                message = {
                  type: 'text',
                  text: "#{store.name}のお気に入りを解除しました。"
                }
              else
                message = {
                  type: 'text',
                  text: "何らかの原因で解除できませんでした。"
                }
              end
            else
              message = {
                type: 'text',
                text: "既にお気に入りは解除されています。"
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'].eql?('プロフィール')
            client.reply_message(event['replyToken'], user_action_confirm)
          elsif event.message['text'].eql?('パン屋お気に入り')
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            user.stores.each do |n|
              @store = n
              client.push_message(user.line_id, store_favo_delete)
            end
          elsif event.message['text'].eql?("'onopanマニュアル")
            manual = <<~TEXT
              ▼LINE Botの機能\n\n
              (1)ユーザープロフィール操作\n
              画面下の「ここを押すとメニューが出るよ」を押して「プロフィール」を押して下さい。\n
              「作成」「編集」「削除」のボタンから操作したい項目を選んで下さい。\n\n
              (2)パン屋お気に入り解除\n
              画面下の「ここを押すとメニューが出るよ」を押して「パン屋お気に入り」を押して下さい。\n
              商品を購入したことのあるパン屋が表示されます。\n
              パン屋の中にあるお気にいり解除ボタンを押すと、パン屋との繋がりを解除できます。\n\n
              (3)商品購入\n
              プロフィールを登録しているユーザーに、パン屋から商品の情報が届きます。\n
              購入したいパンが見つかったら、購入ボタンを押して下さい。\n
              パン屋が注文を確定すると、メッセージが届きますのでお待ち下さい。
            TEXT
            message = {
              type: 'text',
              text: manual
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
          elsif event.message['text'].eql?('プロフィール編集')
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            unless user
              message = {
                type: 'text',
                text: 'プロフィールが登録されていません'
              }
            else
              edit_text = <<~TEXT
                下記の中から編集したい項目を選んでメッセージを送って下さい\n
                （例）名前を田中から佐藤に変えたい場合【名前：佐藤】と送って下さい\n
                名前：#{user.name}\n
                年齢：#{user.age}\n
                性別：#{user.sex}\n
                職業：#{user.profession}\n
                メールアドレス：#{user.email}\n
                住所：#{user.address}
              TEXT
              message = {
                type: 'text',
                text: edit_text
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'] =~ /^.*名前[ 　：:]([^【】:： 　]*)/
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            old_user_name = user.name
            user.name = $1
            if user.save
              message = {
                type: 'text',
                text: "名前を#{old_user_name}から#{$1}に更新しました"
              }
            else
              message = {
                type: 'text',
                text: "名前の更新に失敗しました。"
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'] =~ /^.*年齢[ 　：:]([^【】:： 　]*)/
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            old_user_age = user.age
            user.age = $1
            if user.save
              message = {
                type: 'text',
                text: "年齢を#{old_user_age}から#{$1}に更新しました"
              }
            else
              message = {
                type: 'text',
                text: "年齢の更新に失敗しました。"
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'] =~ /^.*性別[ 　：:]([^【】:： 　]*)/
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            old_user_sex = user.sex
            user.sex = $1
            if user.save
              message = {
                type: 'text',
                text: "性別を#{old_user_sex}から#{$1}に更新しました"
              }
            else
              message = {
                type: 'text',
                text: "性別の更新に失敗しました。"
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'] =~ /^.*職業[ 　：:]([^【】:： 　]*)/
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            old_user_profession = user.profession
            user.profession = $1
            if user.save
              message = {
                type: 'text',
                text: "職業を#{old_user_profession}から#{$1}に更新しました"
              }
            else
              message = {
                type: 'text',
                text: "職業の更新に失敗しました。"
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'] =~ /^.*メールアドレス[ 　：:]([^【】:： 　]*)/
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            old_user_email = user.email
            user.email = $1
            if user.save
              message = {
                type: 'text',
                text: "メールアドレスを#{old_user_email}から#{$1}に更新しました"
              }
            else
              message = {
                type: 'text',
                text: "メールアドレスの更新に失敗しました。"
              }
            end
            client.reply_message(event['replyToken'], message)
          elsif event.message['text'] =~ /^.*住所[ 　：:]([^【】:： 　]*)/
            line_id = event['source']['userId']
            user = User.find_by(line_id: line_id)
            old_user_address = user.address
            user.address = $1
            if user.save
              message = {
                type: 'text',
                text: "住所を#{old_user_address}から#{$1}に更新しました"
              }
            else
              message = {
                type: 'text',
                text: "住所の更新に失敗しました。"
              }
            end
            client.reply_message(event['replyToken'], message)
          else
            message = {
              type: 'text',
              text: "その指示は操作プログラムにありません。\nごめんなさい。"
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
                "type": "message",
                "label": "編集",
                "text": "プロフィール編集"
              },
              {
                "type": "message",
                "label": "削除",
                "text": "プロフィール削除"
              }
          ]
      }
    }
  end

  def store_favo_delete
    store_text = <<~TEXT
      店舗名：#{@store.name}\n
      住所：#{@store.address}\n
      Tel：#{@store.telephone}\n
      営業時間：#{@store.start_time.hour}:#{@store.start_time.min}〜#{@store.end_time.hour}:#{@store.end_time.min}\n
      アクセス方法：#{@store.access}
    TEXT
    {
      "type": "template",
      "altText": "This is a buttons template",
      "template": {
          "type": "buttons",
          "text": store_text,
          "defaultAction": {
              "type": "uri",
              "label": "View detail",
              "uri": "http://example.com/page/123"
          },
          "actions": [
              {
                "type": "message",
                "label": "お気に入り解除",
                "text": "#{@store.name}のお気に入り解除_#{@store.id}"
              }
          ]
      }
    }
  end
end
