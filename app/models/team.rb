class Team < ActiveRecord::Base
	has_one :roster
	has_many :games
	has_many :seasons
	has_many :leagues, through: :season
	has_many :player_stats, through: :games
	belongs_to :user
end
