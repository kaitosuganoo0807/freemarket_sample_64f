class CategoryController < ApplicationController

  def set_sub_category
    @category = SubCategory.where(main_categoty_id: params[:id])
  end

  def set_sub2_category
    @category = Sub2Category.where(sub_category_id: params[:id])
  end
end