class AddColumnsToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	add_column :users, :facebook_image, :string
  	add_column :users, :oath_token, :string
  	add_column :users, :oauth_expires_at, :datetime
  end
end
