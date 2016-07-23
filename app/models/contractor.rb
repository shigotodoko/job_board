class Contractor < ApplicationRecord
  validates :name, :address, :phone_number, :mail_address, presence: true

  has_many :posts
  has_many :contacts, dependent: :destroy
end
