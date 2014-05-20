class Event < ActiveRecord::Base
	belongs_to :club
	has_many :tickets
	has_many :users, through: :tickets
end
