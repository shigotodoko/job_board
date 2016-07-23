class Contact < ApplicationRecord
  belongs_to :contractor
  has_many :contactables
  has_many :posts, through: :contactables

  validates :name, :phone_number, :mail_address, presence: true
end
