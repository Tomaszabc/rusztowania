class OrderMailer < ApplicationMailer
  include OrderMailerHelper
  default from: 'stillasstillas6@gmail.com'
 
  def order_confirmation(order)
    @order = order
    
   mail(to: 'stillasstillas6@gmail.com', subject: 'Order Confirmation')
  #  mail(to: 'darektech@gmail.com', subject: 'Order Confirmation')
    
  end

end
