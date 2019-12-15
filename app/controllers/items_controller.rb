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
      params[:images][:image].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show
  end


  def item_params
    params.require(:item).permit(:name, :deteil, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer, images_attributes: [:image])
  end
  private

  def create_items_instance
    @item = Item.new
  end

  def set_items
    @item = Item.find(params[:id])
  end
end
