class AddDeletedAtToPart < ActiveRecord::Migration[7.0]
  def change
    add_column :parts, :deleted_at, :datetime
    add_index :parts, :deleted_at
  end
end
