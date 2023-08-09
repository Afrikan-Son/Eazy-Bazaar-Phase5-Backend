class UserMailer < ApplicationMailer
  default from: 'eazybazaarcommerce@gmail.com' # Replace with your email address

  def send_signup_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our App')
  end
  def order_confirmation_email(user, order)
    @user = user
    @order = order

    mail(to: @user.email, subject: 'Order Confirmation')
  end
end
