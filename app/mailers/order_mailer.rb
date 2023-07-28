class OrderMailer < ApplicationMailer
  include OrderMailerHelper
  default from: 'stillasstillas6@gmail.com'
 
  def order_confirmation(order)
    @order = order
    mailer_emails = DeliveryEmail.pluck(:recipient_email)  # get all emails from the database
    mail(to: mailer_emails, subject: 'Order Confirmation')
  end

end
