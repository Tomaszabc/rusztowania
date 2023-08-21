class DropOrderStorageLists < ActiveRecord::Migration[7.0]
  def up
    if table_exists? :order_storage_lists
      drop_table :order_storage_lists
    end
  end
  

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
