class AddAddressToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :address, :string
  end
end
