class RecipeCourseJoinTable < ActiveRecord::Migration[5.2]
  def up
    unless table_exists? :recipe_courses
      create_table :recipe_courses do |t|
        t.integer :recipe_id
        t.integer :course_type_id
      end
    end
  end

  def down
    drop_table :recipe_courses if table_exists? :recipe_courses
  end
end
