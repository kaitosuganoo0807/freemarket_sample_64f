class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :deteil, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer, images_attributes: [:image])
  end

  def create_items_instance
    @item = Item.new
  end

  def set_items
    @item = Item.find(params[:id])
  end
end
