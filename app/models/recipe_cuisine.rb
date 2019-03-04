class RecipeCuisine < ApplicationRecord
  belongs_to :cuisine_category
  belongs_to :recipe
end