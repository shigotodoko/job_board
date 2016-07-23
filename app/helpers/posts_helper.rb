module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  def ribbon(post)
    if post.expired?
      content_tag(:div, nil, class: 'ribbon') do
        content_tag(:span, 'Expirado!', class: 'expired')
      end
    elsif post.recent_published?
      content_tag(:div, nil, class: 'ribbon') do
        content_tag(:span, 'Novo!', class: 'new')
      end
    end
  end

  def display_status(status)
    if status
      content_tag(:span, 'Publicado', class: 'success label')
    else
      content_tag(:span, 'Expirado', class: 'label')
    end
  end

  def expired_label(post)
    content_tag(:span, 'Anúncio expirado', class: 'round alert label') if post.expired?
  end

  def resume(description = post.description)
    description.truncate(150)
  end

  def shorten(text, limit)
    text.truncate(limit)
  end

  def visit(post)
    link_to(content_tag(:label, 'ver anúncio'), post_path(post), class: 'view')
  end
end
