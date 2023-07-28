class OrderMailer < ApplicationMailer
  include OrderMailerHelper
  default from: 'stillasstillas6@gmail.com'
 
  def order_confirmation(order)
    @order = order
    user_email = @order.user.email
    mailer_emails = DeliveryEmail.pluck(:recipient_email)  # get all emails from the database
    mailer_emails << user_email unless mailer_emails.include?(user_email)
    mail(to: mailer_emails, subject:"Order for: #{@order.building_site}, #{@order.building_site_info}")
  end

end
