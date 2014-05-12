class ClubsController < ApplicationController
  def index
  	@clubs = Club.all
  end

  def my
  	if !user_signed_in?
  		redirect_to(main_landing_path)
  	else
  	 @my_clubs = current_user.clubs
    end
  end

  def show
  	@club = Club.find(params[:id])
  end
end
