class AddContractorIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :contractor_id, :integer
  end
end
