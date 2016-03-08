class ProductsController < ApplicationController
  def index
    @products = Product.all(params[:q])
  end
end
