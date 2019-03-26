class Ingredient < ApplicationRecord
  has_many :ingredient_amounts
  has_many :ingredient_types  
end