class Roster < ActiveRecord::Base
	has_many :users
	belongs_to :team
end
