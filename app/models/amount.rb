class Amount < ApplicationRecord
  has_many :ingredient_amounts

  MEASUREMENTS = [
    ["", 0],
    ["Teaspoons", 1],
    ["Tablespoons", 2],
    ["Fliod Ounces", 3],
    ["Cups", 4],
    ["Pints", 5],
    ["Quarts", 6],
    ["Gallons", 7],
    ["Milliliters", 8],
    ["Liters", 9],
    ["Ounces", 10],
    ["Pounds", 11],
    ["Grams", 12],
    ["Kilograms", 13]
  ]
end