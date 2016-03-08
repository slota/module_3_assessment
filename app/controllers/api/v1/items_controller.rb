class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    respond_with Item.create(name: params[:name], description: params[:description], image_url: params[:image_url])
  end

  def update
    item = Item.find(params[:id])
    respond_with Item.update(name: params[:name], description: params[:description], image_url: params[:image_url])
  end

  def delete
    respond_with Item.delete(params[:id])
  end
end
