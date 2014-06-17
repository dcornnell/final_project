class AddColumnsToLocationTable < ActiveRecord::Migration
  def change
  	add_column :locations, :name, :string
  	add_column :locations, :camping, :boolean, :default => false
  	add_column :locations, :rock_type, :string
  	add_column :locations, :description, :text
  end
end
