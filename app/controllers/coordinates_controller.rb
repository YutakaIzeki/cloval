class CoordinatesController < ApplicationController

  def index
    @coordinates = []
    @coordinate_average_arry = []

    params[:kind].present? ? coordinates = Coordinate.where(sex: params[:kind]) : coordinates = Coordinate.all

    coordinates.each do |coordinate|
      @coordinates << coordinate

      # コーディネートの評価の平均値を計算し、配列に格納
      if coordinate.evaluation_number == 0 
        @coordinate_average_arry << 0
      else
        @coordinate_average_arry << (coordinate.evaluation_value.to_f / coordinate.evaluation_number.to_f).round(1)
      end
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
    coordinate = Coordinate.find(params[:id])
    coordinate.evaluation_value += params[:add_point].to_i
    coordinate.evaluation_number += 1
    coordinate.save
    redirect_to root_path
  end

private

def coordinate_params
  params.require(:coordinate).permit(:image, :sex).merge(user_id: current_user.id)
end




end
