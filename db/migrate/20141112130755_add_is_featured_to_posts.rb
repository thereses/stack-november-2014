class AddIsFeaturedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_featured, :boolean,default: false
  end
end
