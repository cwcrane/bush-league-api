class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
    	t.string :name, null: false
	    t.references :user, index: true, foreign_key: true #commissioner
	    t.references :location, index: true, foreign_key: true
	    t.date :date_created
	    
	    t.timestamps null: false
    end
  end
end
