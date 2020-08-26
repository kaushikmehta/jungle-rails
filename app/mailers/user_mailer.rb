class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(user_order)
    @email = user_order.email
    @order = user_order
    @url =  "http://localhost:3000/orders/#{user_order.id}"

    mail(to: @email, subject: "Order# #{user_order.id} on Jungle")
  end
end
