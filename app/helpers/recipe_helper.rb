module RecipeHelper

  def setup_recipe(recipe)

    10.times { recipe.steps.build }

    10.times do
      ingredient_amount = IngredientAmount.new
      ingredient_amount.ingredient = Ingredient.new 
      ingredient_amount.amount = Amount.new 
      recipe.ingredient_amounts << ingredient_amount
    end

    recipe
  end

end