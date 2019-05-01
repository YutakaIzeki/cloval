class CoordinatesController < ApplicationController

  before_action :set_coordinate, only: [:show, :update]

  def index
    @coordinates = []
    @coordinate_average_arry = []

    params[:kind].present? ? @o_coordinates = Coordinate.where(sex: params[:kind]).page(params[:page]).per(15) : @o_coordinates = Coordinate.all.page(params[:page]).per(15)

    @o_coordinates.each do |coordinate|
      @coordinates << coordinate

      # コーディネートの評価の平均値を計算し、配列に格納
      coordinate.average_calc(@coordinate_average_arry)
    end
  end

  def new
    @coordinate = Coordinate.new
  end
  
  def create
    coordinate = Coordinate.new(coordinate_params)
    if coordinate.save
      redirect_to user_path(current_user.id)
    else
      redirect_to new_coordinate_path
    end  
  end
  
  def show
  end

  def update
    @coordinate.update_coordinate_and_user_evaluation(params[:add_point])
    redirect_to root_path
  end

  def destroy
    coordinate = Coordinate.find(params[:id])
        coordinate.destroy if    coordinate.user_id == current_user.id
  end

private

  def coordinate_params
    params.require(:coordinate).permit(:image, :sex).merge(user_id: current_user.id)
  end

  def set_coordinate
    @coordinate = Coordinate.find(params[:id])
  end

end
