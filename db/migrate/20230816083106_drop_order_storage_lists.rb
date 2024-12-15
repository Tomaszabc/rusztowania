# frozen_string_literal: true

class DropOrderStorageLists < ActiveRecord::Migration[7.0]
  def up
    return unless table_exists? :order_storage_lists

    drop_table :order_storage_lists
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
