class AddColumnActiveToPost < ActiveRecord::Migration
  def up
    add_column :posts, :active, :boolean, :default => false
  end

  def down
    remove_column :posts, :active
  end
end
