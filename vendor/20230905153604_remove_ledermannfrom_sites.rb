class RemoveLedermannfromSites < ActiveRecord::Migration[7.0]
  def change
    remove_column :sites, :ledermann

  end
end
