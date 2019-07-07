class ItemsController < ApplicationController
  def index
    # byebug
    @all = Item.all
    day_id = params[:id]
    items = Day.find(day_id).items
    # byebug
    render json: items
  end

  def create
    # byebug
    item = Item.create(items_param)
    render json: item
  end

  def destroy
    # byebug
    item_id = params[:id]
    item = Item.find(item_id)
    item.destroy
  end


  private

  def items_param
    params.require(:item).permit(:place, :day_id, :longitude, :latitude, :open_now, :rating, :photo, :address)
  end
end
