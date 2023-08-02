class RemoveSystemFromParts < ActiveRecord::Migration[7.0]
  def change
    remove_column :parts, :system, :string
  end
end
