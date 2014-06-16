class RenameNewsTableToPosts < ActiveRecord::Migration
  def change
  	rename_table :news, :posts
  end
end
