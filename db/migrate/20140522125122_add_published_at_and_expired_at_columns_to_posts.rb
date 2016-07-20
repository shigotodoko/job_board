class AddPublishedAtAndExpiredAtColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime
    add_column :posts, :expired_at, :datetime
  end
end
