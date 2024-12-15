# frozen_string_literal: true

class AddStorageInfoToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :storage_info, :text
  end
end
