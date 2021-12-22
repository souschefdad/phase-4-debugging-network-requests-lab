class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    # byebug
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find(params[:id])
    toy.update(toy_params)
    # byebug
    render json: toy, status: :accepted
  end

  def destroy
    toy = Toy.find(params[:id])
    destroyed_toy = toy.destroy
    render json: destroyed_toy, status: :no_content
  end

  private
  
  def toy_params
    params.permit(:id, :name, :image, :likes)
  end

end
