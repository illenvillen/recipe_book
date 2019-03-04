class IngredientAmount < ApplicationRecord
  has_one :ingredient
  has_one :amount  
end