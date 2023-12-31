ActiveAdmin.register Part do
  filter :part_id, label: 'Part Id'
  filter :name
  filter :description
  filter :weight
  filter :multipack
  filter :created_at
  filter :updated_at

  controller do
    def index
      # Zapamiętaj parametry sortowania, jeżeli są obecne
      if params[:order].present?
        session[:parts_order] = params[:order]
      end

      # Przywróć parametry sortowania, jeżeli są zapamiętane
      if session[:parts_order].present?
        params[:order] = session[:parts_order]
      end

      super
    end

    def edit
      # Zapamiętaj bieżące parametry sortowania przed edycją
      if params[:order].present?
        session[:parts_order] = params[:order]
      end

      super
    end

    def update
      # Przywróć zapamiętane parametry sortowania po edycji
      if session[:parts_order].present?
        params[:order] = session[:parts_order]
      end

      super do |success, failure|
        success.html { redirect_to admin_parts_path(order: params[:order]) }
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
    column :name
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
      row :weight
      row :systems do |part|
        part.systems.map(&:name).join(', ')
      end
      row :categories do |part|
        part.categories.map(&:name).join(', ')
      end
      row :image do |part|
        if part.image.attached?
          image_tag(part.image.variant( resize_to_limit: [400, 400] ))
        else
          content_tag(:span, 'No image attached')
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :weight
      f.input :system_ids, as: :check_boxes, collection: System.all.map { |system| [system.name, system.id] }
    f.input :category_ids, as: :check_boxes, collection: Category.all.map { |category| [category.name, category.id] }
      f.input :multipack
      if f.object.image.attached?
        div do
          image_tag url_for(f.object.image.variant( resize_to_limit: [400, 400]))
        end
      end
      f.file_field :image
    end
    f.actions
  end
  
end
