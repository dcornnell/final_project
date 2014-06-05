class ChangeRolesIdToRoleIdColumnInUserTable < ActiveRecord::Migration
  def change
  	rename_column :users, :roles_id, :role_id
  end
end
