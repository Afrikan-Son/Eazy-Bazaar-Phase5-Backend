class ReviewsController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_comment_not_found
  def index
    render json: Review.all
  end
  def create
    review = Review.create!(review_params)
    render json: review, status: :created
  end
  def destroy
    review = find_by
    review.destroy
    head :no_content
  end
  def update
    review = find_by
    review.update!(review_params)
    render json: review,status: :accepted
  end
  private
  def find_by
    review = Review.find(params[:id])
  end
  def render_review_not_found
    render json: {error: "Review Not Found"},status: :not_found
  end
  def review_params
    params.require(:review).permit(:description,:product_id,:user_id, :rider_id)
  end
end
