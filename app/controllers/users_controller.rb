class UsersController < ApplicationController

  def show

    # ユーザーの投稿一覧
    @coordinates = []
    @coordinate_average_arry = []
    
    # ビューでpopを使うためにAcctiveRecord配列からrubyの配列に入れ直し
    current_user.coordinates.each do |coordinate|
      @coordinates << coordinate
      # コーディネートの評価の平均値を計算し、配列に格納
      coordinate.average_calc( @coordinate_average_arry )
    end
    
    # いいねした投稿一覧
    @current_user_liked_coordinates = []
    @current_user_liked_coordinate_average_arry = []
    
    # ビューでpopを使うためにAcctiveRecord配列からrubyの配列に入れ直し
    like_lists = Like.where(user_id: current_user.id).includes(:coordinate)
    
    like_lists.each  do |like|
      @current_user_liked_coordinates << like.coordinate
      # コーディネートの評価の平均値を計算し、配列に格納
      like.coordinate.average_calc( @current_user_liked_coordinate_average_arry )
    end

  end
end
