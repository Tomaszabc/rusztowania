ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :status
  
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :status
    column :created_at
    column :updated_at
    actions
  end
  
  
  
  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :status, as: :select, collection: %w[scaffolder admin lagermann], include_blank: false
      
  
    f.li do
      f.label 'Hint:' 
      f.div 'Leave password empty if no password change', class: 'instruction-text'
    end
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
 
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
