class User < ActiveRecord::Base
  include Authentication
  	has_many :leagues
  	belongs_to :roster
  	has_many :stats
  	has_many :teams
end
