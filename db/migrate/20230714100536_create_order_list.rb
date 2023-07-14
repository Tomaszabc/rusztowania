class CreateOrderList < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lists do |t|
      t.references :order, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
