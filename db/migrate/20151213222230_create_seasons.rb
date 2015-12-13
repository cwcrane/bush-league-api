class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
	    t.references :team, index: true, foreign_key: true #commissioner
	    t.references :league, index: true, foreign_key: true
	    t.date :start_date, null: false
	    t.date :end_date, null: false
	    
	    t.timestamps null: false
    end
  end
end
