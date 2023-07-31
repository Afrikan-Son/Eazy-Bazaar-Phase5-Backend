class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        reviews = Review.all 
        render json: reviews, status: :ok 
    end
    
    def create
        reviews = Review.create!(review_params) 
        render json: reviews, status: :created 
    end

    def show
        review = Review.find(params[:id])
        render json: review 
    end

    private

    def review_params
        params.permit(:description) 
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
