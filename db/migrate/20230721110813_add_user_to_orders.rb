# frozen_string_literal: true

class AddUserToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user, null: true, foreign_key: true
  end
end
