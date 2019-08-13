require 'line/bot'

class LinebotController < ApplicationController
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

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
          end
        end
      end
    }

    head :ok
  end

  private

  def user_form

  end
end
