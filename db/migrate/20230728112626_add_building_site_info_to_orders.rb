class AddBuildingSiteInfoToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :building_site_info, :text
  end
end
