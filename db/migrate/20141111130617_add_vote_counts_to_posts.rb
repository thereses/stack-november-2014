class AddVoteCountsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :votes_count, :integer
  	add_index :posts, :votes_count
  end
end
