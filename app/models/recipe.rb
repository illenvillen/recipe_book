class Recipe < ApplicationRecord

  include RecipeHelper

  has_many :recipe_cuisines
  has_many :cuisine_categories, :through => :recipe_cuisines
  has_many :steps
  has_many :recipe_ingredient_amounts
  has_many :ingredient_amounts, :through => :recipe_ingredient_amounts
  has_many :recipe_courses
  has_many :course_types, :through => :recipe_courses
  has_many :ingredients, :through => :ingredient_amounts

  validates :cuisine_categories, :presence => true
  validates :course_types, :presence => true
  validates :name, :presence => true
  validates :prep_time, :presence => true, :numericality =>  {:greater_than_or_equal_to => 0}
  validates :cook_time, :presence => true, :numericality =>  {:greater_than_or_equal_to => 0}

  accepts_nested_attributes_for :steps, :reject_if => :all_blank
  accepts_nested_attributes_for :ingredient_amounts, :reject_if => :all_blank
  accepts_nested_attributes_for :ingredients

  DIFFICULTIES = [
    ["Easy", 1],
    ["Medium", 2],
    ["Advanced", 3],
    ["Expert", 4]
  ]

  def self.six_random_recipes
    max = Recipe.count
    recipes = []
  
    6.times do
      recipes << Recipe.all[rand(max)]
    end

    recipes
  end
end
