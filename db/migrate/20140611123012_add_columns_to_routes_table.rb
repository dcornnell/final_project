class AddColumnsToRoutesTable < ActiveRecord::Migration
  def change
  	add_column :routes, :rating, :integer
  	add_column :routes, :rating_count, :integer
  end
end
