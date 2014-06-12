class RemoveSomecolumsFromRouteTable < ActiveRecord::Migration
  def change
  	remove_column :routes, :rating
  	remove_column :routes, :rating_count
  end
end
