class UsersController < ApplicationController

  def index
    @users = User.all
    @club = Club.find(params[:id])
  end

  def add_admin
  	@club = Club.find(params[:club_id])
  	@user = User.find(params[:user_id])
  	if !@user.clubs.include?(@club)
        @user.clubs << @club
    end
  end

end