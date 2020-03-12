class ChangeDataDeliveryChargeToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :delivery_charge, :integer
  end
end
