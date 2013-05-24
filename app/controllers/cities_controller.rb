class CitiesController < ApplicationController

  def new
      @city = City.new
  end

  def create
      @city = City.new(params[:city])

      if @city.save
          redirect_to @city
      else
          render 'new'
      end
  end

  def show
    @city = City.find(params[:id])
  end

end
