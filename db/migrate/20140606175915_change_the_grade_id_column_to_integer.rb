class ChangeTheGradeIdColumnToInteger < ActiveRecord::Migration
  def change
  	change_column :routes, :grade_id, :integer
  end
end
