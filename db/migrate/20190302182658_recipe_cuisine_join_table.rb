class RecipeCuisineJoinTable < ActiveRecord::Migration[5.2]
  def up
    unless table_exists? :recipe_cuisines
      create_table :recipe_cuisines do |t|
        t.integer :recipe_id
        t.integer :cuisine_category_id
      end
    end
  end

  def down
    drop_table :recipe_cuisines if table_exists? :recipe_cuisines
  end
end
