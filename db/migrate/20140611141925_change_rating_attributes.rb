class ChangeRatingAttributes < ActiveRecord::Migration
  def change
  	change_column :routes, :rating, :decimal, :default => 0
  end
end
