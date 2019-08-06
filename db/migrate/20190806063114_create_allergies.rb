class CreateAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :allergies do |t|
      t.references :user, foreign_key: true, null: false
      t.references :ingredient, foreign_key: true, null: false

      t.timestamps
    end
  end
end
