class Step < ApplicationRecord
  belongs_to :recipe
  has_many :tools
  has_many :ingredient_amounts
end