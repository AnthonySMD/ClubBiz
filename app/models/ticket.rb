class Ticket < ActiveRecord::Base

	attr_accessor :number_tickets

	belongs_to :event
	belongs_to :user
end
