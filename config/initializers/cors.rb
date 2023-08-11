# frozen_string_literal: true

# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001', %r{https://.*\.netlify\.app/}
    resource '*', headers: :any, methods: %i[get post patch put delete]
  end
end
