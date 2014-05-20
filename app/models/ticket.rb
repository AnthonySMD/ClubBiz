class Ticket < ActiveRecord::Base
<<<<<<< HEAD
=======
	
	attr_accessor :number_tickets

>>>>>>> FETCH_HEAD
	belongs_to :event
	belongs_to :user
end
