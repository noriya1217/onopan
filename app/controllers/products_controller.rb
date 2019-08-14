require 'line/bot'

class ProductsController < ApplicationController
  # before_action :set_store
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.order(created_at: :asc)
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    @product.store_id = current_store.id
    if @product.save
      client
      # TODO: 全端末に送るように後で変更
      user_id = 'U088ecb9e49b8eddf06df8fcf64e9aebb'
      client.push_message(user_id, product_message)
      redirect_to products_path, notice: '新しい商品を作成しました'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      client
      # TODO: 全端末に送るように後で変更
      user_id = 'U088ecb9e49b8eddf06df8fcf64e9aebb'
      client.push_message(user_id, product_message)
      redirect_to products_path, notice: '商品情報を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: '商品を削除しました'

  end

  private

  # def set_store
  #   @store = Store.find(current_store.id)
  # end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :number,
      :price,
      :content,
      :preservation,
      :how_to_eat,
      :expiration,
      :shipping,
      :remarks,
      :store_id,
      product_images_attributes: %i[id image product_id],
    )
  end

  def product_message
    {
      "type": "flex",
      "altText": "Flex Message",
      "contents": {
        "type": "bubble",
        "hero": {
          "type": "image",
          # TODO: パン商品の画像のURLをここに貼る。ローカルじゃだめ？@product.product_images.first.image.url
          "url": "https://cdn.pixabay.com/photo/2019/05/09/20/57/bread-4192142_960_720.jpg",
          "size": "full",
          "aspectRatio": "20:13",
          "aspectMode": "cover",
          "action": {
            "type": "uri",
            "label": "Action",
            "uri": "https://linecorp.com"
          }
        },
        "body": {
          "type": "box",
          "layout": "vertical",
          "spacing": "md",
          "action": {
            "type": "uri",
            "label": "Action",
            "uri": "https://linecorp.com"
          },
          "contents": [
            {
              "type": "text",
              "text": "#{@product.store.name}",
              "size": "xl",
              "weight": "bold"
            },
            {
              "type": "box",
              "layout": "vertical",
              "spacing": "sm",
              "contents": [
                {
                  "type": "box",
                  "layout": "vertical",
                  "spacing": "sm",
                  "margin": "lg",
                  "contents": [
                    {
                      "type": "box",
                      "layout": "baseline",
                      "spacing": "sm",
                      "contents": [
                        {
                          "type": "text",
                          "text": "#{t('activerecord.attributes.store.address')}",
                          "flex": 2,
                          "size": "sm",
                          "color": "#AAAAAA"
                        },
                        {
                          "type": "text",
                          "text": "#{@product.store.address}",
                          "flex": 5,
                          "size": "sm",
                          "color": "#666666",
                          "wrap": true
                        }
                      ]
                    },
                    # TODO: 評価入れたい
                    {
                      "type": "box",
                      "layout": "baseline",
                      "spacing": "sm",
                      "contents": [
                        {
                          "type": "text",
                          "text": "#{t('activerecord.attributes.product.name')}",
                          "flex": 2,
                          "size": "sm",
                          "color": "#AAAAAA"
                        },
                        {
                          "type": "text",
                          "text": "#{@product.name}",
                          "flex": 5,
                          "size": "sm",
                          "color": "#666666",
                          "wrap": true
                        }
                      ]
                    },
                    {
                      "type": "box",
                      "layout": "baseline",
                      "spacing": "sm",
                      "contents": [
                        {
                          "type": "text",
                          "text": "#{t('activerecord.attributes.product.price')}",
                          "flex": 2,
                          "size": "sm",
                          "color": "#AAAAAA"
                        },
                        {
                          "type": "text",
                          "text": "#{@product.price.to_s(:delimited)}円",
                          "flex": 5,
                          "size": "sm",
                          "color": "#666666",
                          "wrap": true
                        }
                      ]
                    },
                    {
                      "type": "box",
                      "layout": "baseline",
                      "spacing": "sm",
                      "contents": [
                        {
                          "type": "text",
                          "text": "#{t('activerecord.attributes.product.number')}",
                          "flex": 2,
                          "size": "sm",
                          "color": "#AAAAAA"
                        },
                        {
                          "type": "text",
                          "text": "#{@product.number.to_s(:delimited)}個",
                          "flex": 5,
                          "size": "sm",
                          "color": "#666666",
                          "wrap": true
                        }
                      ]
                    },
                    # TODO: 原材料
                    {
                      "type": "box",
                      "layout": "baseline",
                      "spacing": "sm",
                      "contents": [
                        {
                          "type": "text",
                          "text": "#{t('activerecord.attributes.product.expiration')}",
                          "flex": 2,
                          "size": "sm",
                          "color": "#AAAAAA"
                        },
                        {
                          "type": "text",
                          "text": "#{@product.expiration}",
                          "flex": 5,
                          "size": "sm",
                          "color": "#666666",
                          "wrap": true
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        "footer": {
          "type": "box",
          "layout": "vertical",
          "contents": [
            {
              "type": "spacer",
              "size": "xxl"
            },
            {
              "type": "button",
              "action": {
                "type": "message",
                "label": "購入",
                "text": "購入_#{@product.id}"
              },
              "color": "#905C44",
              "style": "primary"
            }
          ]
        }
      }
    }
  end
end
