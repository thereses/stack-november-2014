class ChangeStoryToPost < ActiveRecord::Migration
  def change
  	remove_column :comments, :story_id, :integer
  	add_column :comments, :post_id, :integer
  end
end
