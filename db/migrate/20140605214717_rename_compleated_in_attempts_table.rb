class RenameCompleatedInAttemptsTable < ActiveRecord::Migration
  def change
  	rename_column :attempts, :compleated, :completed
  end
end
