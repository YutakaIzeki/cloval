class UsersController < ApplicationController

  def show

    # ビューでpopを使うためにAcctiveRecord配列からrubyの配列に入れ直し
    @coordinates = []
    @coordinate_average_arry = []

    current_user.coordinates.each do |coordinate|
      @coordinates << coordinate

      # コーディネートの評価の平均値を計算し、配列に格納
      if coordinate.evaluation_number == 0 
        @coordinate_average_arry << 0
      else
        @coordinate_average_arry << (coordinate.evaluation_value.to_f / coordinate.evaluation_number.to_f).round(1)
      end
    end



  end
end
