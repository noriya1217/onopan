class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :score, null: false
      t.references :store, foreign_key: true, null: false

      t.timestamps
    end
  end
end
