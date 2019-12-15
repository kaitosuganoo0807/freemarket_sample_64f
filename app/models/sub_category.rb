class SubCategory < ApplicationRecord
  belongs_to :main_categoty
  has_many   :sub2_categories
end
