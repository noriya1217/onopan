class ChangeDataLineIdOfUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :line_id, :string, null: false
  end
end
