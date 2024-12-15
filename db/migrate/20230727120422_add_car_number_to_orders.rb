# frozen_string_literal: true

class AddCarNumberToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :car_number, :string
  end
end
