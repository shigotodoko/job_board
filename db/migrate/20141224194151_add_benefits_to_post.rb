class AddBenefitsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :benefits, :text
  end
end
