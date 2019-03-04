class SetupInitialRecords < ActiveRecord::Migration[5.2]
  def up
    unless table_exists? :recipes
      create_table :recipes do |t|
        t.string :name
        t.decimal :prep_time
        t.decimal :cook_time
        t.string :difficulty
      end
    end

    unless table_exists? :course_types
      create_table :course_types do |t|
        t.string :name
      end
    end

    unless table_exists? :cuisine_categories
      create_table :cuisine_categories do |t|
        t.string :name
        t.integer :region_id
      end
    end

    unless table_exists? :regions
      create_table :regions do |t|
        t.string :name
      end
    end

    unless table_exists? :ingredient_amounts
      create_table :ingredient_amounts do |t|
        t.integer :ingredient_id
        t.integer :amount_id
      end
    end

     unless table_exists? :ingredients
      create_table :ingredients do |t|
        t.string :name
      end
    end

    unless table_exists? :ingredient_types
      create_table :ingredient_types do |t|
        t.string :name
      end
    end

    unless table_exists? :amounts
      create_table :amounts do |t|
        t.string :measurement
        t.decimal :quantity
      end
    end

    unless table_exists? :steps
      create_table :steps do |t|
        t.string :step_text
        t.integer :recipe_id
      end
    end

    unless table_exists? :tools
      create_table :tools do |t|
        t.string :name
        t.string :type
      end
    end
  end

  def down
    drop_table :recipes if table_exists? :recipes
    drop_table :course_types if table_exists? :course_types
    drop_table :cuisine_categories if table_exists? :cuisine_categories
    drop_table :regions if table_exists? :regions
    drop_table :ingredient_amounts if table_exists? :ingredient_amounts
    drop_table :ingredient_types if table_exists? :ingredient_types
    drop_table :amounts if table_exists? :amounts
    drop_table :steps if table_exists? :steps
    drop_table :recipes if table_exists? :recipes
  end
end
