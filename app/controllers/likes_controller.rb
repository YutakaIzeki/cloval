class LikesController < ApplicationController

  before_action :logged_in_user

  def create
    binding.pry
    @coordinate = Coordinate.find(params[:coordinate_id])
    unless @coordinate.like?(current_user)
      @coordinate.like(current_user)
      respond_to do |format|
        format.html{ redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @coordinate = Like.find(params[:id]).coordinate
    if @coordinate.like?(current_user)
      @coordinate.unlike(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
end
