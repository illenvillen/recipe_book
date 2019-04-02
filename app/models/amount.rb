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

  def fraction_quantity
    if quantity.present?
      whole_number = decimal_quanity.to_i.to_s
      fraction = (decimal_quanity%1).to_r.rationalize(0.1).to_s
      return whole_number.to_i > 0 ? (whole_number + " " + fraction) : fraction
    end

    return nil
  end

  def decimal_quanity
    quantity.present? ? quantity.split.map { |r| Rational(r) }.inject(:+).to_f : nil
  end
end
