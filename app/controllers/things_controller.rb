class ThingsController < ApplicationController

  def new
      @thing = Thing.new
  end

  def create
      @thing = Thing.new(params[:thing])

      if @thing.save
          redirect_to @thing
      else
          render 'new'
      end
  end

  def show
      @thing = Thing.find(params[:id])
  end

end
