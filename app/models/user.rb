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

end
