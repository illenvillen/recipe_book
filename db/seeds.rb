# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CourseType.destroy_all
CourseType.create([ 
  {:name => "Entree", :description => "The main course"},
  {:name => "Soft Drink", :description => "A non-alcoholic drink"},
  {:name => "Alcoholic Drink", :description => "A drink with alcohol in it"},
  {:name => "Dessert", :description => "The best course"},
  {:name => "Carb Side", :description => "A side dish that is mostly carbohydrates"},
  {:name => "Vegetable Side", :description => "A side dish that is mostly vegetables"}
])

Region.destroy_all
Region.create([ 
  {:name => "South East Asia", :description => "SEA"},
  {:name => "Asia", :description => "AS"},
  {:name => "Americas", :description => "AM"},
  {:name => "Europe", :description => "EU"},
  {:name => "Middle East", :description => "ME"},
  {:name => "Africa", :description => "AF"}
])

CuisineCategory.destroy_all
americas_region = Region.where(:name => "Americas").first
sea_region = Region.where(:name => "South East Asia").first
euro_region = Region.where(:name => "Europe").first
CuisineCategory.create([ 
  {:name => "Vietnamese", :region => sea_region, :description => "Distintive flavors that focus on one of the five fundamental tastes"},
  {:name => "Thai", :region => sea_region, :description => "Intense flavors with a lot of vegetables and rice"},
  {:name => "BBQ", :region => americas_region, :description => "An american style focused on smoking"},
  {:name => "Tex-Mex", :region => americas_region, :description => "An americanized versin of Mexan cuisine"},
  {:name => "Greek", :region => euro_region, :description => "Heavy use of vegetables, olice oil, grains, wine, meat, lamb, and olives"},
  {:name => "French", :region => euro_region, :description => "Light sauces and airy desserts"},
  {:name => "Italian", :region => euro_region, :description => "Heavy sauces and filling meals"}
])

Recipe.destroy_all
Recipe.create([
  {
    :name => 'Tacos',
    :prep_time => 10,
    :cook_time => 30,
    :difficulty => 2,
    :steps => [
      Step.create({:step_text => 'Cook meat, place into bowl'}),
      Step.create({:step_text => 'Place ingredients out on lazy susan'}),
      Step.create({:step_text => 'Consume'})
    ],
    :cuisine_categories => CuisineCategory.where(:name => 'Tex-Mex'),
    :course_types => CourseType.where(:name => 'Entree')
  },
  {
    :name => 'Pho',
    :prep_time => 30,
    :cook_time => 30,
    :difficulty => 4,
    :steps => [
      Step.create({:step_text => 'Make broth'}),
      Step.create({:step_text => 'Add ingredients to broth'}),
      Step.create({:step_text => 'Heat and Consume'})
    ],
    :cuisine_categories => CuisineCategory.where(:name => 'Thai'),
    :course_types => CourseType.where(:name => 'Entree')
  },
  {
    :name => 'Cornbread',
    :prep_time => 10,
    :cook_time => 0,
    :difficulty => 1,
    :steps => [
      Step.create({:step_text => 'Buy cornbread from store'}),
      Step.create({:step_text => 'Cut and serve'})
    ],
    :cuisine_categories => CuisineCategory.where(:name => 'BBQ'),
    :course_types => CourseType.where(:name => 'Carb Side')
  },
  {
    :name => 'Grits',
    :prep_time => 5,
    :cook_time => 90,
    :difficulty => 1,
    :steps => [
      Step.create({:step_text => 'Pour grits into boiling water'}),
      Step.create({:step_text => 'Wait'}),
      Step.create({:step_text => 'Drain grits'}),
      Step.create({:step_text => 'Top with cheese and serve'})
    ],
    :cuisine_categories => CuisineCategory.where(:name => 'BBQ'),
    :course_types => CourseType.where(:name => 'Carb Side')
  },
  {
    :name => 'Baked Ziti',
    :prep_time => 45,
    :cook_time => 45,
    :difficulty => 2,
    :steps => [
      Step.create({:step_text => 'Cook Ziti'}),
      Step.create({:step_text => 'Add cheese'}),
      Step.create({:step_text => 'Add sauce'}),
      Step.create({:step_text => 'Top with more cheese'}),
      Step.create({:step_text => 'Bake'})
    ],
    :cuisine_categories => CuisineCategory.where(:name => 'Italian'),
    :course_types => CourseType.where(:name => 'Entree')
  },
  {
    :name => 'Garlic Bread',
    :prep_time => 5,
    :cook_time => 20,
    :difficulty => 1,
    :steps => [
      Step.create({:step_text => 'Spread garlic butter on bread'}),
      Step.create({:step_text => 'Bake'})
    ],
    :cuisine_categories => CuisineCategory.where(:name => 'Italian'),
    :course_types => CourseType.where(:name => 'Carb Side')
  },
  {
    :name => 'Side Salad',
    :prep_time => 5,
    :cook_time => 20,
    :difficulty => 1,
    :steps => [
      Step.create({:step_text => 'Buy vegetables and lettuce'}),
      Step.create({:step_text => 'Put everyting in a bowl'})
    ],
    :cuisine_categories => CuisineCategory.where(:name => 'Greek'),
    :course_types => CourseType.where(:name => 'Vegetable Side')
  }
])