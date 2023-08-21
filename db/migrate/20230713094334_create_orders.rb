class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :building_site
      t.date :delivery_date
      t.text :info
      t.string :part_number
      t.string :part_description
      t.integer :quantity
      t.decimal :weight

      t.timestamps
    end
  end
end
