class ApplicationController < ActionController::API
  before_filter :authenticate_with_token!

  private

  def authenticate_with_token!
    auth_token = params[:auth_token].presence
    token      = auth_token && AuthToken.find_by_token(auth_token.to_s)
    user = token && token.user

    now = DateTime.now

    if !user
      render json: {message: 'Invalid API Token'}, status: :unauthorized
    elsif  (token.valid_until && token.valid_until < now)
      render json: {message: 'Token expired'}, status: :unauthorized
    end

    @current_user ||= user
  end
end