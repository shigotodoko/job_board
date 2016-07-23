class Contactable < ApplicationRecord
  belongs_to :contact
  belongs_to :post
end
