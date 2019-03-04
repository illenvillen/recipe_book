class ApplicationController < ActionController::Base

  def create_new
    render 'shared/create_new'
  end

  def homepage
    render 'shared/homepage'
  end
end
