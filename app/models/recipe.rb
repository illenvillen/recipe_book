class Recipe < ApplicationRecord

  has_many :recipe_cuisines
  has_many :cuisine_categories, :through => :recipe_cuisines
  has_many :steps
  has_many :ingredient_amounts
  has_many :recipe_courses
  has_many :course_types, :through => :recipe_courses

  accepts_nested_attributes_for :steps

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