class UpdateAllPostsToActive < ActiveRecord::Migration
  def self.up
    execute "UPDATE posts SET active = 't';"
  end

  def self.down
    execute "UPDATE posts SET active = 'f';"
  end
end
