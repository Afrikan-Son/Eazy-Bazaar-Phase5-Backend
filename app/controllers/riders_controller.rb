# frozen_string_literal: true

class RidersController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_rider_not_found
  def index
    render json: Rider.all
  end

  def show
    rider = find_by
    render json: rider, status: :ok
  end

  def create
    rider = Rider.create!(rider_params)
    render json: rider, status: :created
  end

  def destroy
    rider = find_by
    rider.destroy
    head :no_content
  end

  def update
    rider = find_by
    rider.update!(rider_params)
    render json: rider, status: :accepted
  end

  private

  def find_by
    Rider.find(params[:id])
  end

  def render_rider_not_found
    render json: { error: 'Rider Not Found' }, status: :not_found
  end

  def rider_params
    params.require(:rider).permit(:name, :phone_number)
  end
end
