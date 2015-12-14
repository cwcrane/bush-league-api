class League < ActiveRecord::Base
	belongs_to :user
	has_many :seasons
	has_many :teams, through: :season
	has_one :location 
end
