class RemoveSystemFromParts < ActiveRecord::Migration[7.0]
  def change
    remove_column :parts, :system, :string if column_exists?(:parts, :system)
   
  end
end
