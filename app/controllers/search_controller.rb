class SearchController < ApplicationController
  def index
    @query = params[:q]
    @category = params[:category]

    @results = if @category.present?
        case @category
        when 'addresses'
          Address.where("street_name LIKE ?", "%#{@query}%")
        when 'schools'
          School.where("school LIKE ?", "%#{@query}%")
        when 'parks'
          Park.where("park_name LIKE ?", "%#{@query}%")
        else
          []
        end
      else
        Address.where("street_name LIKE ?", "%#{@query}%")
        .or(School.where("school LIKE ?", "%#{@query}%"))
        .or(Park.where("park_name LIKE ?", "%#{@query}%"))
      end
  end
end
