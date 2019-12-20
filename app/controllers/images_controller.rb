class ImagesController < ApplicationController
  def destroy
    @image = Image.find(image_params)
    @image.destroy
  end

  private

  def images_params
    params.require(:image).permit(:image).merge(item_id: item.id)
end
