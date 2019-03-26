class RecipeIngredientAmount < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient_amount
end