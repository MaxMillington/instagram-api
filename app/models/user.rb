class User < ActiveRecord::Base

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(
        provider: data.provider, uid: data.uid)

    user.website = data.info.website
    user.nickname = data.info.nickname
    user.nickname = data.info.nickname
    user.image_url = data.info.image
    user.token = data.credentials.token
    user.save

    user

  end

  def client
    @client = Instagram.client(access_token: token)
  end

  def next_url
    client.user_media_feed.pagination.next_url
  end

  def client_user
    client.user
  end

  def feed
    client.user_media_feed.first(18)
  end

  def profile_posts(id)
    client.user_recent_media(id).first(18)
  end

  def posts
    client.user_recent_media.first(18)
  end

end
