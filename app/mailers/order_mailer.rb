class OrderMailer < ApplicationMailer
  include OrderMailerHelper
  default from: 'stillasstillas6@gmail.com'
 
  def order_confirmation(order)
    @order = order
    user_email = @order.user.email
    mailer_emails = DeliveryEmail.pluck(:recipient_email)
    mailer_emails << user_email unless mailer_emails.include?(user_email)

    site = Site.find_by(name: @order.building_site)
    if site&.ledermann.present?
      mailer_emails << site.ledermann.email
    end
    mailer_emails = mailer_emails.uniq
    mail(to: mailer_emails, subject:"Order for: #{@order.building_site}, #{@order.building_site_info}")
  end


  def storage_confirmation(order, current_user)
    @order = order
    mailer_emails_with_desc = @order.recipients_emails(current_user)
    mailer_emails = mailer_emails_with_desc.map(&:last).uniq
    mail(to: mailer_emails, subject:"Order for: #{@order.building_site}, #{@order.building_site_info}")  end
  

end
