class RecipeSearchService 
  include ActiveModel::Model

  attr_accessor :search_params, :errors, :recipes

  def initialize(params:)
    @search_params = params
    @errors = []
    @recipes = []
  end

  def execute
    find_recipes
  end

  def successful?
    errors.empty?
  end

  def find_recipes
    puts "search_params"
    puts search_params

    @recipes = Recipe.all
    @recipes = @recipes.where("UPPER(name) LIKE UPPER('%#{search_params[:name]}%')") unless search_params[:name].empty?
    
    unless search_params[:max_time].empty?
      query = """
        SELECT id, SUM(cook_time + prep_time) as total_time
        FROM recipes
        GROUP BY id """
      total_time_recipes = ActiveRecord::Base.connection.exec_query(query).map { |r| r["id"] if r["total_time"].to_i <= search_params[:max_time].to_i }
      @recipes = @recipes.where(:id => total_time_recipes)
    end
    
    @recipes = @recipes.joins(:cuisine_categories).where(:cuisine_categories => {:id => search_params[:cuisine_category].to_i}) unless search_params[:cuisine_category].empty?
    @recipes = @recipes.joins(:course_types).where(:course_types => {:id => search_params[:course].to_i}) unless search_params[:course].empty?
    @recipes = @recipes.order(:name)

  end


end