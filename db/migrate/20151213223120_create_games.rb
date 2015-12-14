class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
	    t.date :date
	    t.time :time
	    t.references :home_team#, index: true, foreign_key: true
	    t.references :away_team#, index: true, foreign_key: true
	    #Home and Away team hold references to rows in the team table. I define the references in the Game model. 
	    t.integer :home_goals
	    t.integer :away_goals

	    t.timestamps null: false
    end
  end
end
