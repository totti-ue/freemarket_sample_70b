class RenameDeliveryOriginColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_origin, :delivery_origin_id
  end
end
