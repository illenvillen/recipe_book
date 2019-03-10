class Region < ApplicationRecord
  has_many :cuisine_categories

  validates :name, :presence => true

end