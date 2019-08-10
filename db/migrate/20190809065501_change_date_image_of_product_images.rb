class ChangeDateImageOfProductImages < ActiveRecord::Migration[5.2]
  def change
    change_column :product_images, :image, :text, null: false
  end
end
