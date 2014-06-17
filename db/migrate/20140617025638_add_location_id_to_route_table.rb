class AddLocationIdToRouteTable < ActiveRecord::Migration
  def change
  	add_column :routes, :location_id, :integer
  end
end
