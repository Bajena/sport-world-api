class User < ActiveRecord::Base
  has_one :auth_token, dependent: :destroy

  has_secure_password

  after_create :create_auth_token

  def create_auth_token
    AuthToken.create(:user => self)
  end
end
