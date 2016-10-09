class PostDecorator < Draper::Decorator
  delegate_all

  def short_description
    object.description.truncate(150)
  end

  def contact_name
    contact_source.name
  end

  def contact_email
    contact_source.mail_address
  end

  def contact_phone
    contact_source.phone_number
  end

  def contact_phone_and_name
    contact_source.phone_and_name
  end

  def recent_published?
    object.published_at && object.published_at > 1.week.ago
  end

  private

  def contact_source
    if object.contact.present?
      ContactDecorator.decorate(object.contact)
    else
      ContractorDecorator.decorate(object.contractor)
    end
  end
end
