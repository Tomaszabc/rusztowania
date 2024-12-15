# frozen_string_literal: true

class AddHiddenToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :hidden, :boolean, default: false
  end
end
