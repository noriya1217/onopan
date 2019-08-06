class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true, null: false
      t.references :store, foreign_key: true, null: false

      t.timestamps
    end
  end
end
