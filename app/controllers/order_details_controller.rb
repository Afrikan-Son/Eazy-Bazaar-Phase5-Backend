# frozen_string_literal: true

class OrderDetailsController < ApplicationController
  before_action :authorized
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_order_detail_record_unprocessable_entity
  def create
    order_details = OrderDetail.create!(order_details_params)
    render json: order_details, status: :created
  end

  private

  def order_details_params
    params.require(:order_details).permit(:order_id, :product_id, :quantity)
  end

  def invalid_order_detail_record_unprocessable_entity
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
