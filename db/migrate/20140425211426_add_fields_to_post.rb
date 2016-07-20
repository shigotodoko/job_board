class AddFieldsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :requirements, :text
    add_column :posts, :salary, :string
    add_column :posts, :work_load, :string
    add_column :posts, :shift, :string
    add_column :posts, :day_off, :string
  end
end
