class EventsController < ApplicationController
  def show
  	@event = Event.find(params[:id])
  end

  def index
  	@events = Event.all
  end

  def my
  	if !user_signed_in?
  		redirect_to(main_landing_path)
  	else
	  	my_clubs = current_user.clubs
	  	@my_events = []
	  	my_clubs.each do |club|
	  		club.events.each do |event|
	  			@my_events << event
	  		end
	  	end
	end
  end
end
