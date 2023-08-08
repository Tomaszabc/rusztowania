ActiveAdmin.register Order do
 
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
  index do
    selectable_column
    id_column
    column :building_site
    column :building_site_info
    column :delivery_date
    column :total_weight
    column :created_at
    column :user
    column :info
    actions
  end


  show do
    attributes_table do
      row :building_site
      row :building_site_info
      row :delivery_date
      row :user
      row :info
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
  

  form do |f|
    f.inputs "Order Details" do
      f.input :user, as: :select, collection: User.all
      f.input :building_site, as: :select, collection: Site.all.map { |site| [site.name, site.name] }
      f.input :building_site_info
      f.input :delivery_date
      f.input :new_delivery_date
      f.input :info
      f.input :car_number
      f.input :status
      # Dodaj tutaj inne pola, które chcesz wyświetlić
    end

    f.actions # Dodaje standardowe przyciski akcji, takie jak "Save"
  end

end
