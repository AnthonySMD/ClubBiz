class EventsController < ApplicationController
  def show
    get_free_tickets
  end

  def index
  	@events = Event.all
  end

  def my
  	# Redirect if user is not signed in
    if !user_signed_in?
  		redirect_to(main_landing_path)
  	else
    # Collect all events from current user's clubs
	  	my_clubs = current_user.clubs
	  	@my_events = []
	  	my_clubs.each do |club|
	  		club.events.each do |event|
	  			@my_events << event
	  		end
	  	end
    end
	end
  
  def purchase_ticket
    get_free_tickets
    if !@free_tickets.empty?
      current_user.tickets << @free_tickets.pop
    end
    redirect_to(@event)
  end

  def unattend
    @event = Event.find(params[:id])
    puts params[:id].class
    current_user.tickets.each { |ticket| puts ticket.event_id.class }
    
    t = current_user.tickets.find_index {|t| t.event_id == params[:id].to_i }
    current_user.tickets[t].user_id = nil
    current_user.tickets[t].save
    redirect_to(@event)
  end

  # Find free tickets
  def get_free_tickets
    @event = Event.find(params[:id])
    @free_tickets = []
    @event.tickets.each do |ticket|
      if ticket.user_id == nil
        @free_tickets.push(ticket)
      end
    end
  end

end
