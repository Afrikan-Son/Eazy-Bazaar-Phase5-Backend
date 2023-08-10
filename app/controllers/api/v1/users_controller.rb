# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorized, only: [:create]
      skip_before_action :authorized, only: %i[index destroy]

      def index
        render json: User.all
      end

      def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
      end

      def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token({ user_id: @user.id })

          UserMailer.send_signup_email(@user).deliver_now

          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created

        else
          render json: { error: 'failed to create user' }, status: :unprocessable_entity
        end
      end

      def destroy
        user = find_by
        user.destroy
        head :no_content
      end

      private

      def find_by
        User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar, :email, :contact_info, :is_admin)
      end
    end
  end
end
