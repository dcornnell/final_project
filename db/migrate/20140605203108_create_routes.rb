class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
    	t.string "name"
    	t.integer "grade"
    	t.string "info"
    	t.integer "modifier"
    	t.integer "score"
    	t.timestamps
    end
  end
end
