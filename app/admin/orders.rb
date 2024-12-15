# frozen_string_literal: true

ActiveAdmin.register Order do
  filter :user
  filter :building_site, as: :select, collection: proc { Site.all.map(&:name) }
  filter :delivery_date
  filter :created_at
  filter :car_number
  filter :status, as: :select, collection: Order.statuses.map { |key, value| [value, key] }

  permit_params :user_id, :building_site, :building_site_info, :delivery_date, :new_delivery_date, :info, :car_number,
                :status, :checkbox, :storage_info, order_lists_attributes: %i[part_id quantity description delivery_quantity checkbox]

  member_action :print, method: :get do
    @order = Order.find(params[:id])
    render pdf: "order_#{@order.id}", template: 'admin/orders/print',
           margin: { top: 10,
                     bottom: 10,
                     left: 15,
                     right: 15 }
  end

  sidebar 'Orders by Building Site', only: :index do
    @orders_grouped_by_site = Order.group(:building_site).count
    @labels = @orders_grouped_by_site.keys
    @data = @orders_grouped_by_site.values

    div do
      render partial: 'admin/orders_chart', locals: { labels: @labels, data: @data }
    end
  end

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
    column :status do |order|
      order.status.humanize
    end
    actions
  end

  action_item :print, only: :show, class: 'left-align-action' do
    link_to 'Print this Order', print_admin_order_path(resource), class: 'custom-green-button'
  end

  show do
    attributes_table do
      row :building_site
      row :building_site_info
      row :delivery_date
      row :new_delivery_date
      row :user
      row :info
      row :storage_info
      row :car_number
      row :status
      row :hidden, class: 'row-hidden'
      row :total_weight
    end

    panel 'Ordered Parts', class: 'ordered-parts' do
      table_for order.order_lists do
        column :quantity
        column :delivery_quantity
        column 'Art. Number' do |order_list|
          order_list.part.name
        end

        column :description

        column :weight
      end
    end

    panel 'Parts added in Storage(Lagerman parts)', class: 'storage-parts' do
      table_for order.order_storage_lists do
        column :quantity
        column 'Art. Number' do |storage_list|
          storage_list.part.name
        end
        column :description

        column :weight
      end
    end
  end

  form do |f|
    f.inputs 'Order Details' do
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
