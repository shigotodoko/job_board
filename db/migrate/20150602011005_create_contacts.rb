class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :contractor
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
