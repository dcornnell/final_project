class ChangeRatingCountDefaultToZero < ActiveRecord::Migration
  def change
  	change_column :routes, :rating_count, :integer, :default => 0
  end
end
