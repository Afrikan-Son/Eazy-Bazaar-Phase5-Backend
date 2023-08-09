class Api::V1::OrdersController < ApplicationController
  before_action :authorized
  
 before_action :find_user

  def index
    @orders = @user.orders
    render json: @orders
  end


  def create
    order = Order.create!(order_params)
    UserMailer.order_confirmation_email(@user, order).deliver_now
    render json: order, status: :created
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def invalid_order_record_unprocessable_entity(invalid)
  render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
  def order_params
    params.require(:order).permit(:user_id,:rider_id, :total_amount, :date)
  end


end
