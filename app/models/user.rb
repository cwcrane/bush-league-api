class User < ActiveRecord::Base
  include Authentication
  	has_many :leagues
  	belongs_to :roster
  	has_many :player_stats
  	has_many :teams
end
