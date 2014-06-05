class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
    	t.integer "user_id"
    	t.integer "route_id"
    	t.date "date_attempted"
    	t.boolean "flash"
    	t.boolean "compleated"
    	t.integer "attempt_score"
    	t.string "notes"

    	t.timestamps
    end
  end
end
