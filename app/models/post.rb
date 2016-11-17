class Post < ApplicationRecord
  belongs_to :contractor
  has_one :contactable
  has_one :contact, through: :contactable

  validates :title, :location, :description, :salary, :shift, :day_off, :work_load, presence: true

  attr_accessor :contractor_company_name, :contractor_person_name, :contractor_phone_number, :contractor_mail_address, :contractor_address

  scope :published, -> { where(published: true) }

  with_options({on: :web}) do |for_user|
    for_user.validates :contractor_person_name, :contractor_company_name, :contractor_address, :contractor_phone_number, presence: true
    for_user.validates :contractor_mail_address, presence: true, format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  end

  def save_for_web
    return unless valid?(context: :web)
    save(context: :web)
  end

  enum status: [:pending, :published, :expired, :cancelled, :archived]

  acts_as_taggable

  after_update :apply_tags
  after_create :apply_tags

  def publish
    if self.save(context: :admin)
      publish!
    else
      false
    end
  end

  def publish!
    self.active = true
    self.published_at = Time.now
    self.published!
    self.save!(context: :admin)
  end

  def expire!
    self.active = false
    self.expired_at = Time.now
    self.expired!
    self.save!(validate: false)
  end

  def archive
    self.archived!
    self.save!(context: :admin)
  end

  def relateds
    Posts::RelatedPosts.find(self)
  end

  private

  def apply_tags
    self.tag_list = Shigotodoko::Tag.new(self.location).classify
  end
end
