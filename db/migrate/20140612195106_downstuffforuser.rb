class Downstuffforuser < ActiveRecord::Migration
  def self.down
    remove_attachment :users, :avatar
  end
end
