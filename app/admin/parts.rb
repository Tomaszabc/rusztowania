ActiveAdmin.register Part do
  filter :part_id, label: 'Part Id'
  filter :name
  filter :description
  filter :weight
  filter :system
  filter :category
  filter :multipack
  filter :created_at
  filter :updated_at

  permit_params :name, :description, :weight, :system, :category, :multipack, :image
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
    column :name
    column :description
    column :weight
    column :system
    column :category
    column :multipack
    column :created_at
    column :updated_at
    column :image do |part|
      if part.image.attached?
        image_tag(part.image.variant( resize_to_limit: [150, 150] ))
      else
        "No image"
      end
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :image do |part|
        if part.image.attached?
          image_tag(part.image.variant( resize_to_limit: [400, 400] ))
        else
          content_tag(:span, 'No image attached')
        end
      end
      # Add more attributes you want to display in the show view

      # If you want to display all other attributes by default, you can use:
      # default_attribute_table_rows(except: [:created_at, :updated_at])
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :weight
      f.input :system
      f.input :category
      f.input :multipack
      f.file_field :image
    end
    f.actions
  end
  
end
