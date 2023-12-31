# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  domain: 'https://eazy-bazaar-ecommerce-app.onrender.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY']
}
