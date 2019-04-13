class UsersController < ApplicationController

  def show
    @number = params[:id]
  end
end
