class Step < ApplicationRecord
  belongs_to :recipe
  has_many :tools
end