# frozen_string_literal: true

class CreateOrderStorageLists < ActiveRecord::Migration[7.0]
  def change
    create_table :order_storage_lists do |t|
      t.references :order, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.integer :quantity
      t.text :description
      t.decimal :weight
      t.timestamps
    end
  end
end
