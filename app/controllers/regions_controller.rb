class RegionsController < ApplicationController

    before_action :load_region, :only => [:show, :edit]

  def index
    @regions = Region.all
  end

  def show
  end

  def new
    @region = Region.new()
  end

  def create
    @region = Region.new(params[:region].to_unsafe_hash)
    @region.save!

    @regions = Region.all
    redirect_to regions_path
  end

  def edit
  end

  def update
  end

  private

  def load_region
    @region = Region.find(params[:id])
  end
end