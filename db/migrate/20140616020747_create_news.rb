class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
    	t.string :title
    	t.integer :user_id
    	t.text :post
    	t.date :post_date
    end
  end
end

