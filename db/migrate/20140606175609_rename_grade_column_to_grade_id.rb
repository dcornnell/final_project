class RenameGradeColumnToGradeId < ActiveRecord::Migration
  def change
  	rename_column :routes, :grade, :grade_id

  end
end
