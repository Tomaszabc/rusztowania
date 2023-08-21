ActiveAdmin.register DeliveryEmail do

  index do
    selectable_column
    
    column :recipient_email

    actions
  end

  form do |f|
    f.inputs do
      f.input :recipient_email

    end
    f.actions 
  end
  permit_params :recipient_email

end