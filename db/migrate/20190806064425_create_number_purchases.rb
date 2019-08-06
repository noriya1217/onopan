class CreateNumberPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :number_purchases do |t|
      t.integer :number, null: false
      t.boolean :permission, null: false
      t.references :user, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false

      t.timestamps
    end
  end
end
