class CreateContractorContacts < ActiveRecord::Migration
  def change
    create_table :contractor_contacts do |t|
      t.integer :contractor_id
      t.integer :contact_id
    end
  end
end
