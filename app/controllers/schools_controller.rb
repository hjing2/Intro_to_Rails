class SchoolsController < ApplicationController
  def index
    @schools = School.page(params[:page]).per(10)
  end

  def show
    @school = School.find(params[:id])
    # @address = @school.address
  end
end
