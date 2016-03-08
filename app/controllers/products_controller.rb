class ProductsController < ApplicationController
  def index
    if params[:q]
      @products = Product.all(params[:q])
    end
  end
end
