Copy code
class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
    @is_sold_out = sold_out_status(@products)
  end

  def show
    @product = Product.find(params[:id])
    @is_sold_out = sold_out_status([@product])
  end

  private

  def sold_out_status(products)
    products.map { |product| product.quantity.zero? }
  end
end