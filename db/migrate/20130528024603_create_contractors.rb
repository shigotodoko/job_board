class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :address
      t.text :info

      t.timestamps
    end
  end
end
