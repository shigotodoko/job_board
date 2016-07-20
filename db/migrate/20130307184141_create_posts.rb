class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :location

      t.timestamps
    end

    add_index :posts, :location
  end
end
