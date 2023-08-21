class AddNewDeliveryDateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :new_delivery_date, :date
  end
end
