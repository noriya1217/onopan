class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.string :image, null: false
      t.references :product, foreign_key: true, null: false

      t.timestamps
    end
  end
end
