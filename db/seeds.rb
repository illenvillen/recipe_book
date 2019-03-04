# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CourseType.destroy_all
CourseType.create([ 
  {:name => "Entree"},
  {:name => "Soft Drink"},
  {:name => "Alcoholic Drink"},
  {:name => "Dessert"},
  {:name => "Carb Side"},
  {:name => "Vegetable Side"}
])

Region.destroy_all
Region.create([ 
  {:name => "South East Asia"},
  {:name => "Asia"},
  {:name => "Americas"},
  {:name => "Europe"},
  {:name => "Middle East"},
  {:name => "Africa"}
])

CuisineCategory.destroy_all
americas_region = Region.where(:name => "Americas").first
sea_region = Region.where(:name => "South East Asia").first
euro_region = Region.where(:name => "Europe").first
CuisineCategory.create([ 
  {:name => "Vietnamese", :region => sea_region},
  {:name => "Thai", :region => sea_region},
  {:name => "BBQ", :region => americas_region},
  {:name => "Mexican", :region => americas_region},
  {:name => "Greek", :region => euro_region},
  {:name => "French", :region => euro_region},
  {:name => "Italian", :region => euro_region},
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
    :cuisine_categories => CuisineCategory.where(:name => 'Mexican'),
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