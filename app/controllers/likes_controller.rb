class LikesController < ApplicationController


  def create
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
end
