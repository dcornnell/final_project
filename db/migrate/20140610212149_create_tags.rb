class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string :name
    end

    create_table :routes_tags, id:false do |t|
    	t.integer :route_id
    	t.integer :tag_id
    end
  end
end
