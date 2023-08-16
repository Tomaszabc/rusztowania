class DropOrderStorageLists < ActiveRecord::Migration[7.0]
  def up
    drop_table :order_storage_lists
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
