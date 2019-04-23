class CoordinatesController < ApplicationController

  def index
    @coordinates = []

    params[:kind].present? ? coordinates = Coordinate.where(sex: params[:kind]) : coordinates = Coordinate.all

    coordinates.each do |coordinate|
      @coordinates << coordinate
    end
  end

  def new
    @coordinate = Coordinate.new
  end
  
  def create
    Coordinate.create(coordinate_params)
    redirect_to user_path(current_user.id)
  end
  
  def show
    @coordinate = Coordinate.find(params[:id])
  end

  def update
    redirect_to root_path
  end

private

def coordinate_params
  params.require(:coordinate).permit(:image, :sex).merge(user_id: current_user.id)
end




end
