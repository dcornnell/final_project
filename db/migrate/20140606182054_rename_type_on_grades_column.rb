class RenameTypeOnGradesColumn < ActiveRecord::Migration
  def change
  	rename_column :grades, :type, :route_type
  end
end
