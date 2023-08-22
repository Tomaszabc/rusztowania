class AddDeletedAtToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :deleted_at, :datetime
    add_index :sites, :deleted_at
  end
end
