class ContactDecorator < Draper::Decorator
  delegate_all

  def phone_and_name
    "#{object.phone_number} (#{object.name})"
  end
end
