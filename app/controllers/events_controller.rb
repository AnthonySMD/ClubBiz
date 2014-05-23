class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
    get_free_tickets
  end

  def index
  	@events = Event.all
  end

  def new
    @club = Club.find(params[:club_id])
    @event = Event.new
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

  def edit
    @club = Club.find(params[:club_id])
  end

  def create
    @club = Club.find(event_params[:club_id])
    @event = Event.new(event_params)
    @event.club = @club

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end    
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :time, :maximum_attendees, :location, :description, :club_id)
    end

end
