class CuisineCategoriesController < ApplicationController

    before_action :load_cuisine_category, :only => [:show, :edit]

  def index
    puts 'hi'
    @cuisine_categories = CuisineCategory.all
  end

  def show
  end

  def new
    @cuisine_category = CuisineCategory.new()
  end

  def create
    region = Region.find(params[:cuisine_category][:region_id])

    @cuisine_category = CuisineCategory.new(:region => region, :name => params[:cuisine_category][:name])
    if @cuisine_category.valid?
      @cuisine_category.save!

      @cuisine_categories = CuisineCategory.all
      redirect_to cuisine_categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def load_cuisine_category
    @cuisine_category = CuisineCategory.find(params[:id])
  end
end