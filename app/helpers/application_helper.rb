module ApplicationHelper
  def title(page_title)
    content_for(:title, "#{page_title} - ShigotoDoko")
  end

  def top_banner
    render '/shared/top_banner'
  end
end
