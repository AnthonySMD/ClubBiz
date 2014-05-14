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

  def join
    @club = Club.find(params[:id])
    if !current_user.clubs.include?(@club)
      current_user.clubs << @club
    end
    redirect_to(@club)
  end
end

