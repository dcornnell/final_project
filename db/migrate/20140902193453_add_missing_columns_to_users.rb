class AddMissingColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :role_id, :integer, :default => 2
  	add_column :users, :total_score, :integer, :default => 0
  end
end
