class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name, null: false
	    t.references :user, index: true, foreign_key: true #captain
	    t.date :date_created			
	    
	    t.timestamps null: false
    end
  end
end
