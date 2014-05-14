class Ticket < ActiveRecord::Base
	belongs_to :event, :user
end
