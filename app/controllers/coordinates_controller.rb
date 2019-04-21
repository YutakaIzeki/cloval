class CoordinatesController < ApplicationController

  def index
    
  end

  def new
    @coordinate = Coordinate.new
  end
  
  def create
    redirect_to user_path(current_user.id)
  end
  
  def show
    @coordinate = Coordinate.new
  end

  def update
    redirect_to root_path
  end

private

def coordinate_params
  params.require(:coordinate)
end




end
