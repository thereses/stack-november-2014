class AddUrlToStories < ActiveRecord::Migration
  def change
  	add_column :posts, :url, :string
  end
end
