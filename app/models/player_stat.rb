class PlayerStat < ActiveRecord::Base
	belongs_to :games
	belongs_to :user
	has_one :team, through: :games
end
