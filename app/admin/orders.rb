ActiveAdmin.register Order do
  filter :user
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :building_site, :delivery_date, :info, :part_number, :part_description, :quantity, :weight
  #
  # or
  #
  # permit_params do
  #   permitted = [:building_site, :delivery_date, :info, :part_number, :part_description, :quantity, :weight]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # permit_params :building_site, :delivery_date, :info, :part_number, :part_description, :quantity, :weight
  #
  
  show do
    attributes_table do
      row :building_site
      row :delivery_date
      # ... tu wypisz atrybuty Ordera
    end

    panel 'Order Lists' do
      table_for order.order_lists do
        column :quantity
        column :description
        column :weight
        # ... tu wypisz atrybuty, które chcesz wyświetlać z OrderList
      end
    end
  end  
  
end
