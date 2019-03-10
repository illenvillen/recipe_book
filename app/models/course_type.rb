class CourseType < ApplicationRecord
  has_many :recipe_courses
  has_many :recipes, :through => :recipe_courses

  validates :name, :presence => true

end