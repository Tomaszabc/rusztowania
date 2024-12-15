# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def storage_confirmation
    order = Order.first # or however you want to fetch an example order
    user = User.first # or however you want to fetch an example user
    OrderMailer.storage_confirmation(order, user)
  end
end
