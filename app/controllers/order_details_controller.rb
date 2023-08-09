class OrderDetailsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_order_detail_record_unprocessable_entity
  def create
    
  end

  private
  def order_details_params
    params.require(:order_details).permit(:order_id,:product_id,:quantity)
  end

  def invalid_order_detail_record_unprocessable_entity
    
  end
end
