class User < ActiveRecord::Base
  has_one :auth_token, dependent: :destroy

  has_secure_password

  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}

  after_create :create_auth_token

  def create_auth_token
    current_token = self.auth_token

    if current_token
      AuthToken.destroy(current_token)
    end

    AuthToken.create(:user => self)
  end
end