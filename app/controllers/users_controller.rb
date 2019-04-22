class UsersController < ApplicationController

  def show
    # ビューでpopを使うためにAcctiveRecord配列からrubyの配列に入れ直し
    @coordinates = []
    current_user.coordinates.each do |coordinate|
      @coordinates << coordinate
    end
  end
end
