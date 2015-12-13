class CreatePlayerStats < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
    	t.references :game, index: true, foreign_key: true
	    t.references :user, index: true, foreign_key: true
	    t.references :team, index: true, foreign_key: true
	    t.references :season, index: true, foreign_key: true
	    t.integer :goals
	    t.integer :assists
	    t.decimal :penalty_mins

	    t.timestamps null: false
    end
  end
end
