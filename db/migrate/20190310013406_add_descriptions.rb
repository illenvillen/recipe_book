class AddDescriptions < ActiveRecord::Migration[5.2]
  def up
    add_column :course_types, :description, :string unless column_exists?(:course_types, :description)
    add_column :cuisine_categories, :description, :string unless column_exists?(:cuisine_categories, :description)
    add_column :regions, :description, :string unless column_exists?(:regions, :description)
  end

  def down
    remove_column :course_types, :description if column_exists?(:course_types, :description)
    remove_column :cuisine_categories, :description if column_exists?(:cuisine_categories, :description)
    remove_column :regions, :description if column_exists?(:regions, :description)
  end
end
