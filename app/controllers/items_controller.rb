class ItemsController < ApplicationController

  before_action :user_login,only:[:new]
  before_action :set_items, only:[:show,:edit,:destroy,:update]

  def index
    @items = Item.all.order(created_at:"desc").limit(10)
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def show
    @items = Item.all.order(created_at:"desc").limit(6)
    @images = @item.images
    @image = @images.first
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

  def edit
    @images = @item.images.order(id: "desc")
  end

  def update
    if params[:item][:images_attributes] == nil
      @item.update(item_update_params)
      redirect_to action: 'show'
    else
      @item.images.destroy_all
      if @item.update(item_params)
        redirect_to action 'show'
      else
        redirect_to(edit_item_path, notice: '編集できませんでした')
      end
    end
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to controller: :items, action: :index
  end
  

  private

    def item_params
      params.require(:item).permit(:name, :description, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer, images_attributes: [:image]).merge(user_id: current_user.id)
    end
  
    def create_items_instance
      @item = Item.new
    end

    def set_items
      @item = Item.find(params[:id])
    end

    def user_login
      return redirect_to new_user_session_path  unless user_signed_in?
    end

end
