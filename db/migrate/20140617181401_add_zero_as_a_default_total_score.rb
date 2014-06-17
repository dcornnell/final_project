class AddZeroAsADefaultTotalScore < ActiveRecord::Migration
  def change
  	change_column :users, :total_score, :integer, :default => 0
  end
end
