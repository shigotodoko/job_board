class ContractorDecorator < Draper::Decorator
  delegate_all

  def phone_and_name
    "#{object.phone_number}"
  end
end
