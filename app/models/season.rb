class Season < ActiveRecord::Base
	belongs_to :league
	belongs_to :team	
	#this is a join table for many-to-many
end
