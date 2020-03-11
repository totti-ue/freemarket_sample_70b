class RenameSalerIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :saler_id, :seller_id
  end
end
