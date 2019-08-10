class ChangeDateImageOfStores < ActiveRecord::Migration[5.2]
  def change
    change_column :stores, :image, :text, null: false
  end
end
