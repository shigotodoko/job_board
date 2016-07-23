class User < ApplicationRecord
  ADMINS = ['klebershimabuku@gmail.com']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :posts
  has_one   :province

  #scope :admin, ->(user) { ADMINS.include? user.email }
  #
  def admin?
    ADMINS.include? self.email
  end
end
