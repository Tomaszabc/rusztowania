ActiveAdmin.register Part do
  filter :part_id, label: 'Part Id'
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
