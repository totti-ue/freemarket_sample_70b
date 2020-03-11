class RenameDeliveryChageColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_chage, :delivery_charge
  end
end
