class User < ActiveRecord::Base
  belongs_to :identity, foreign_key: 'auth_id'

  def self.find_or_create_from_omniauth(auth)
    where(provider: auth['provider'], auth_id: auth['uid']).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.auth_id  = auth['uid']
    end
  end
end