class CreateUsedIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :used_ingredients do |t|
      t.references :product, foreign_key: true, null: false
      t.references :ingredient, foreign_key: true, null: false

      t.timestamps
    end
  end
end
