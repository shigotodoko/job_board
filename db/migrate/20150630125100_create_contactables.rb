class CreateContactables < ActiveRecord::Migration
  def change
    create_table :contactables do |t|
      t.references :post, :contact

      t.timestamps null: false
    end
  end
end
