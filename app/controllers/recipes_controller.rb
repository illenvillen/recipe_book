class RecipesController < ApplicationController

  before_action :load_recipe, :only => [:show, :edit, :update]

  def index
    @recipe_search = RecipeSearch.new() 

    unless params[:recipe_search].nil?
      service = RecipeSearchService.new(:params => params[:recipe_search])
      service.execute

      if service.successful?
        @recipes = service.recipes
      end
    end
  end

  def show
  end

  def new
    @recipe = Recipe.new()
  end

  def create
    params[:recipe][:course_types] = CourseType.where(:id => params[:recipe][:course_types].map { |ct| ct.to_i })
    params[:recipe][:cuisine_categories] = CuisineCategory.where(:id => params[:recipe][:cuisine_categories].map { |cc| cc.to_i })

    @recipe = Recipe.new(params[:recipe].to_unsafe_hash)
    if @recipe.valid?
      @recipe.save!

      @recipe.steps.each do |step|
        step.save!
      end

      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    params[:recipe][:course_types] = CourseType.where(:id => params[:recipe][:course_types].to_i)
    params[:recipe][:cuisine_categories] = CuisineCategory.where(:id => params[:recipe][:cuisine_categories].to_i)
    
    @recipe.update_attributes(params[:recipe].to_unsafe_hash)

    @recipe.steps.each do |step|
      step.save!
    end

    redirect_to recipe_path(@recipe)
  end

  private

  def load_recipe
    @recipe = Recipe.find(params[:id])
  end
end
