class AddCheckboxToOrderStorageLists < ActiveRecord::Migration[7.0]
  def change
    add_column :order_storage_lists, :checkbox, :boolean, default: false
  end
end
