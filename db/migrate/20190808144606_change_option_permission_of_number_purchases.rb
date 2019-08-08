class ChangeOptionPermissionOfNumberPurchases < ActiveRecord::Migration[5.2]
  def change
    change_column :number_purchases, :permission, :boolean, null: false, default: false
  end
end
