# frozen_string_literal: true

ActiveAdmin.register Site do
  permit_params :name, :address, :ledermann_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs 'Site Details' do
      f.input :name
      f.input :address
      f.input :ledermann, as: :select, collection: User.all.sort_by do |user|
        user.email.downcase
      end.map { |user| [user.email, user.id] }
    end
    f.actions
  end

  controller do
    def create
      super do |_format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end
end
