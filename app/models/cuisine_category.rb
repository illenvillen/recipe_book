class CuisineCategory < ApplicationRecord
  belongs_to :region
  has_many :recipe_cuisines
  has_many :recipes, :through => :recipe_cuisines

end