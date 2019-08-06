class AddColumnToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :name, :string, null: false
    add_column :stores, :address, :string, null: false
    add_column :stores, :telephone, :string, null: false
    add_column :stores, :start_time, :time, null: false
    add_column :stores, :end_time, :time, null: false
    add_column :stores, :access, :string, null: false
    add_column :stores, :image, :string, null: false
  end
end
