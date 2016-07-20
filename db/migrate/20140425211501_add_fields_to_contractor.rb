class AddFieldsToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :phone_number, :string
    add_column :contractors, :mail_address, :string
  end
end
