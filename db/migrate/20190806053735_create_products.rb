class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.integer :price, null: false
      t.text :content, null: false
      t.text :preservation, null: false
      t.text :how_to_eat, null: false
      t.text :expiration, null: false
      t.text :shipping, null: false
      t.text :remarks
      t.references :store, foreign_key: true, null: false

      t.timestamps
    end
  end
end
