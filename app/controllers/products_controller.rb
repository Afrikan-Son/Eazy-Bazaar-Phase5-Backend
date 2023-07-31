class ProductsController < ApplicationController
   skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_product_not_found
  def index
    render json: Product.all
  end

  def show
    product = find_by
    render json: product,status: :ok
  end
  def create
    product = Product.create!(product_params)
    render json: product, status: :created
  end
  def destroy
    product = find_by
    product.destroy
    head :no_content
  end
  def update
    product = find_by
    product.update!(product_params)
    render json: product,status: :accepted
  end
  private
  def find_by
    product = Product.find(params[:id])
  end
  def render_review_not_found
    render json: {error: "Product Not Found"},status: :not_found
  end
  def product_params
    params.require(:product).permit(:name,:category,:description,:price,:image)
  end
end
