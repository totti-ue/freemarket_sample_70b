class RemoveBrandIdFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :brand_id, :bigint
  end

  def down
    add_column :items, :brand, :string
  end

end
