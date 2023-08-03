class UserMailer < ApplicationMailer
  default from: 'eazybazaarcommerce@gmail.com' # Replace with your email address

  def send_signup_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our App')
  end
end
