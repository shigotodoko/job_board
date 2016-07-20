class CreatePostProvinces < ActiveRecord::Migration
  def change
    create_table :post_provinces, :id => false do |t|
      t.integer :post_id
      t.integer :province_id

      t.timestamps
    end
  end
end
