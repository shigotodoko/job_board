class FixContactColumnNames < ActiveRecord::Migration
  def change
    rename_column :contacts, :email, :mail_address
    rename_column :contacts, :phone, :phone_number
  end
end
