class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title,            null: false
      t.text :text,               null: false
      t.references :category,     null: false
      t.references :brand
      t.integer :status,          null: false
      t.string :delivery_chage,   null: false
      t.string :delivery_origin,  null: false
      t.string :delivery_size,    null: false
      t.string :delivery_method,  null: false
      t.string :delivery_days,    null: false
      t.integer :price,           null: false
      t.references :history
      t.references :saler,        null: false
      t.references :buyer
      t.timestamps
    end
  end
end

