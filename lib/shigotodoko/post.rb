#encoding: utf-8
module Shigotodoko
  class Post
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :title, :location, :description, :requirements, :salary, :shift, :day_off, :benefits, :work_load
    attr_accessor :contractor_company_name, :contractor_person_name, :contractor_phone_number, :contractor_mail_address, :contractor_address

    validates :title, presence: true
    validates :location, presence: true
    validates :description, presence: true
    validates :salary, presence: true
    validates :shift, presence: true
    validates :day_off, presence: true

    validates :contractor_person_name, presence: true
    validates :contractor_company_name, presence: true
    validates :contractor_address, presence: true
    validates :contractor_mail_address, presence: true, format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
    validates :contractor_phone_number, presence: true

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end

  end
end
