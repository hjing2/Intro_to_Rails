class ParksController < ApplicationController
  def index
    @parks = Park.page(params[:page]).per(10)
  end

  def show
    @park = Park.find(params[:id])
  end
end
