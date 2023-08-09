# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    # Add an expiration time to the payload (e.g., 1 hour from now)
    payload[:exp] = 1.hour.from_now.to_i
    # should store secret in env variable
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split(' ')[1]
    # header: { 'Authorization': 'Bearer <token>' }
    begin
      # Set 'true' for 'verify_iat' to validate the 'iat' claim (issued at) if present
      JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
    rescue JWT::ExpiredSignature
      # If token has expired, return nil
      nil
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
