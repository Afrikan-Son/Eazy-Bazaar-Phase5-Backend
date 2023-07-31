class RidersController < ApplicationController
    def index
        riders = Rider.all 
        render json: riders, status: :ok 
    end

    def show
        rider = Rider.find(params[:id])
        render json: rider 
    end

end
