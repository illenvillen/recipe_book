Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes
  resources :course_types
  resources :cuisine_categories
  resources :regions
  resources :ingredients

  root 'application#homepage'

  match 'create_new' => 'application#create_new', :via => [:get]
  match 'homepage' => 'application#homepage', :via => [:get]
  match 'admin' => 'application#admin', :via => [:get]
end
