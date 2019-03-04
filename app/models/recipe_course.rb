class RecipeCourse < ApplicationRecord
  belongs_to :course_type
  belongs_to :recipe
end