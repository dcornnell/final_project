class CreateGrade < ActiveRecord::Migration
  def change
    create_table :grades do |t|
    	t.string :type
    	t.integer :score
    	t.string :name
    	
    end
  end
end
