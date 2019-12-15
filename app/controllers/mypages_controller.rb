class MypagesController < ApplicationController
  def index
    @category = MainCategoty.all.includes(sub_categories: :sub2_categories)
  end

  def destroy
    @category = MainCategoty.all.includes(sub_categories: :sub2_categories)
  end

  def card
    @category = MainCategoty.all.includes(sub_categories: :sub2_categories)
  end

  def card_new
    @category = MainCategoty.all.includes(sub_categories: :sub2_categories)
  end

  def profile
    @category = MainCategoty.all.includes(sub_categories: :sub2_categories)
  end

  def identification
    @category = MainCategoty.all.includes(sub_categories: :sub2_categories)
  end
end
