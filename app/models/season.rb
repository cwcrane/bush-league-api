class Season < ActiveRecord::Base
	belongs_to :league
	belongs_to :team	
	has_many :games, through: :team
	#this is a join table for many-to-many
end
