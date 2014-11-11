class AuthToken < ActiveRecord::Base
  TOKEN_VALIDITY_IN_MINUTES = 120

  belongs_to :user

  before_create :generate_token

  private

  def generate_token
    begin
      self.token = SecureRandom.hex.to_s
    end while self.class.exists?(token: token)

    self.valid_until = DateTime.now + TOKEN_VALIDITY_IN_MINUTES.minutes
  end
end
