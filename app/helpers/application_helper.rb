module ApplicationHelper
  def render_profile_picture(feed)
    feed.caption.from.profile_picture if feed.caption
  end

  def render_username(feed)
    feed.caption.from.username if feed.caption
  end

  def render_text(feed)
    feed.caption.text if feed.caption
  end
end
