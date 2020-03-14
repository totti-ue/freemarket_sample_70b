class ChangeDataDeliveryOriginToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :delivery_origin, :integer
  end
end
