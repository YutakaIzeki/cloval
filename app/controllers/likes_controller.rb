class LikesController < ApplicationController

  before_action :logged_in_user

  def create
    @coordinate = Coordinate.find(params[:id])
    @coordinate.like(current_user)
  end

  def destroy
    @coordinate = Like.find(params[:id]).coordinate
    @coordinate.unlike(current_user)
  end
end
