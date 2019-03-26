class IngredientAmount < ApplicationRecord
  belongs_to :ingredient
  belongs_to :amount
  has_many :recipe_ingredient_amounts
  has_many :recipes, :through => :recipe_ingredient_amounts  

  accepts_nested_attributes_for :ingredient
  accepts_nested_attributes_for :amount
end