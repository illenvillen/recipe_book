class RecipeIngredientJoinTable < ActiveRecord::Migration[5.2]
  def up
    unless table_exists? :recipe_ingredient_amounts
      create_table :recipe_ingredient_amounts do |t|
        t.integer :recipe_id
        t.integer :ingredient_amount_id
      end
    end
  end

  def down
    drop_table :recipe_ingredient_amounts if table_exists? :recipe_ingredient_amounts
  end
end
