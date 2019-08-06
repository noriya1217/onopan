class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age
      t.string :sex
      t.string :profession
      t.string :email, null: false
      t.string :address, null: false
      t.integer :line_id, null: false

      t.timestamps
    end
  end
end
