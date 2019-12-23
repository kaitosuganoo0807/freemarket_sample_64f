class ItemsController < ApplicationController

  before_action :user_login,only:[:new]
  before_action :set_items, only:[:show,:edit,:destroy,:update]
  before_action :item_update_params, only:[:update]

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
    @sub2_category = Sub2Category.includes(sub_category: :main_category).find(@item.category)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @comments = Comment.where(item_id: @item.id)
  end

  def show
    @items = Item.all.order(created_at:"desc").limit(6)
    @images = @item.images
    @image = @images.first
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @comments = Comment.where(item_id: @item.id)
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
  end

  def update
    respond_to do |format|
    if @item.update(item_update_params)
      if params[:images].present?
        params[:images][:image].each do |image|
        @item.images.create(image: image)
      end
    end
      format.html{redirect_to root_path}
    else
      @item.images.build
      format.html{render action: 'edit'}
    end
  end
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to root_path
  end

  def image_destroy
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

    def item_update_params
      params.require(:item).permit(:name, :description, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer).merge(user_id: current_user.id)
    end

end
