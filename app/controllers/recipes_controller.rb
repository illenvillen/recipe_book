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
        unless step.step_text.empty?
          step.save!
        else
          step.destroy!
        end
      end

      @recipe.ingredient_amounts do |ia|
        ap "///////////////////////////////////////////////////////"
        ap "Ingredient!!!!!!!!!"
        ap "///////////////////////////////////////////////////////"
        ap ia
        ap ia.ingredient
        unless ia.ingredient.name.empty?
          ia.save!
        else
          ia.destroy!
        end
      end

      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    params[:recipe][:course_types] = map_course_types
    params[:recipe][:cuisine_categories] = map_cuisine_categories
    
    @recipe.update_attributes(params[:recipe].to_unsafe_hash)

    ap @recipe
    ap @recipe.ingredient_amounts.count
    ap @recipe.ingredient_amounts.map { |ia| ia.ingredient }
    ap @recipe.ingredient_amounts.map { |ia| ia.ingredient.name.empty? }

    ActiveRecord::Base.transaction do
      @recipe.steps.each do |step|
        unless step.step_text.empty?
          step.save!
        else
          step.destroy!
        end
      end
    end

    ActiveRecord::Base.transaction do
      @recipe.ingredient_amounts.to_a.each do |ia|
        if ia.ingredient.name.empty?
          ia.destroy! 
        else
          ia.save!
        end
      end
    end

    redirect_to recipe_path(@recipe)
  end

  private

  def load_recipe
    @recipe = Recipe.find(params[:id])
  end

  def map_course_types
    CourseType.where(:id => params[:recipe][:course_types].map { |ct| ct.to_i })
  end

  def map_cuisine_categories
    CuisineCategory.where(:id => params[:recipe][:cuisine_categories].map { |cc| cc.to_i })
  end
end
