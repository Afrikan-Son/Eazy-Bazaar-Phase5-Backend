module Api
  module V1
    class AdminController < ApplicationController
      before_action :authorized
      before_action :check_admin

      def admin_action
        render json: { message: 'Welcome to admin area!' }, status: :ok
      end

      private

      def check_admin
        if current_user.is_admin
          # If the user is an admin, allow access and return response
          render json: { ok: 'good riddance' }
          return
        end

        puts current_user
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
end
