class AddressesController < ApplicationController
  def index
    @addresses = Address.page(params[:page]).per(10)
  end

  def show
    @address = Address.find(params[:id])
    # @parks = @address.parks
    # @schools = @address.schools
  end
end
