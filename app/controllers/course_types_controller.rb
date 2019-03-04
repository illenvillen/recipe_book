class CourseTypesController < ApplicationController

    before_action :load_course_type, :only => [:show, :edit]

  def index
    puts 'hi'
    @course_types = CourseType.all
  end

  def show
  end

  def new
    @course_type = CourseType.new()
  end

  def create
    @course_type = CourseType.new(params[:course_type].to_unsafe_hash)
    @course_type.save!

    @course_types = CourseType.all
    redirect_to course_types_path
  end

  def edit
  end

  def update
  end

  private

  def load_course_type
    @course_type = CourseType.find(params[:id])
  end
end