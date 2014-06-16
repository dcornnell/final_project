class RenameOathTokenToOauthTokenOnUserTable < ActiveRecord::Migration
  def change
  	rename_column :users, :oath_token, :oauth_token
  end
end
