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

  end

end
