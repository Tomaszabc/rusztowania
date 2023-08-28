ActiveAdmin.register Order do
  permit_params :user_id, :building_site, :building_site_info, :delivery_date, :new_delivery_date, :info, :car_number, :status, :checkbox, :storage_info, order_lists_attributes: [:part_id, :quantity, :description, :delivery_quantity, :checkbox]
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
    
    column :delivery_date
    column :total_weight
    column :created_at
    column :user
    column :car_number
    column :status
    actions
  end


  show do
    attributes_table do
      row :building_site
      row :building_site_info
      row :delivery_date
      row :new_delivery_datedelivery_date
      row :user
      row :info
      row :storage_info
      row :car_number
      row :status
      row :hidden
      row :total_weight

    end

    panel 'Ordered Parts' do
      table_for order.order_lists do
        column :quantity
        column :delivery_quantity
        column :description
        column :weight
      end
    end

    panel 'Parts added in Storage(Lagerman parts)' do
      table_for order.order_storage_lists do
        column :quantity
        column :description
        column :weight
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
      f.input :status, as: :select, collection: %w[pending in_progress completed missing_parts], include_blank: false
      f.input :hidden
    end

    f.actions 
  end

end
