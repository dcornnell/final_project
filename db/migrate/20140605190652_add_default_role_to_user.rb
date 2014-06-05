class AddDefaultRoleToUser < ActiveRecord::Migration
  def change
  	change_column :users, :roles_id, :integer, :default => 2
  end
end
