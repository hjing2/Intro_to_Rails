class SearchController < ApplicationController
  def index
    @query = params[:q]
    @category = params[:category]

    if @category.present?
      @results = case @category
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
      address_results = Address.where("neighbourhood LIKE ?", "%#{@query}%")
      school_results = School.where("street_name LIKE ?", "%#{@query}%")
      park_results = Park.where("neighbourhood LIKE ?", "%#{@query}%")

      @results = address_results + school_results + park_results
    end
  end
end
