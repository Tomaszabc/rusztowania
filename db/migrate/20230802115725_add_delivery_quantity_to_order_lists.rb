class AddDeliveryQuantityToOrderLists < ActiveRecord::Migration[7.0]
  def change
    add_column :order_lists, :delivery_quantity, :integer
  end
end
