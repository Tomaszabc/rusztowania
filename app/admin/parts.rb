# frozen_string_literal: true

ActiveAdmin.register Part do
  filter :part_id, label: 'Part Id'
  filter :name, label: 'Part Number'
  filter :description
  filter :weight
  filter :multipack
  filter :created_at
  filter :updated_at
  filter :systems, as: :select, collection: -> { System.all }
  filter :categories, as: :select, collection: -> { Category.all }

  controller do
    def index
      # Zapamiętaj parametry sortowania, jeżeli są obecne
      session[:parts_order] = params[:order] if params[:order].present?

      # Przywróć parametry sortowania, jeżeli są zapamiętane
      params[:order] = session[:parts_order] if session[:parts_order].present?

      super
    end

    def edit
      # Zapamiętaj bieżące parametry sortowania przed edycją
      session[:parts_order] = params[:order] if params[:order].present?

      super
    end

    def update
      params[:order] = session[:parts_order] if session[:parts_order].present?

      super do |success, failure|
        success.html do
          redirect_to admin_parts_path(order: params[:order]), notice: 'Part was successfully updated.'
        end
        failure.html do
          redirect_to edit_admin_part_path(resource), alert: resource.errors.full_messages.join(', ')
        end
      end
    end
  end

  permit_params :name, :description, :weight, :category, :multipack, :image, system_ids: [], category_ids: []
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :weight, :system, :category, :multipack, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :weight, :system, :category, :multipack, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column 'Part Number', :name
    column :description
    column :weight
    column :systems do |part|
      part.systems.map(&:name).join(', ')
    end
    column :categories do |part|
      part.categories.map(&:name).join(', ')
    end
    column :multipack
    column :created_at
    column :updated_at
    column :image do |part|
      if part.image.attached?
        image_tag(part.image.variant(resize_to_limit: [150, 150]))
      else
        'No image'
      end
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row 'Part Number', &:name
      row :description
      row :weight
      row :systems do |part|
        part.systems.map(&:name).join(', ')
      end
      row :categories do |part|
        part.categories.map(&:name).join(', ')
      end
      row :image do |part|
        if part.image.attached?
          image_tag(part.image.variant(resize_to_limit: [400, 400]))
        else
          content_tag(:span, 'No image attached')
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Part Number'
      f.input :description
      f.input :weight
      f.input :system_ids, as: :check_boxes, collection: System.all.map { |system| [system.name, system.id] }
      f.input :category_ids, as: :check_boxes, collection: Category.all.map { |category| [category.name, category.id] }
      f.input :multipack
      f.input :image, as: :file, label: 'Image (must be JPG, PNG, GIF format and less than 15MB)'
      if f.object.image.attached? && f.object.image.content_type.in?(%w[image/jpeg image/png image/gif])
        div do
          image_tag url_for(f.object.image.variant(resize_to_limit: [400, 400]))
        end
      end
    end
    f.actions
  end
end
