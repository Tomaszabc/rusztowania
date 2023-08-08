class AddCheckboxToOrderLists < ActiveRecord::Migration[7.0]
  def change
    add_column :order_lists, :checkbox, :boolean
  end
end
