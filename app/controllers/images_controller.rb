class ImagesController < ApplicationController
  def destroy
    @item_image = Image.find(params[:id])
    @item_image.destroy
  end
end
