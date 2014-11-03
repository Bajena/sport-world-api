class ApplicationController < ActionController::API
  before_filter :authenticate_with_token!

  private

  def authenticate_with_token!
    auth_token = params[:auth_token].presence
    token       = auth_token && AuthToken.find_by_token(auth_token.to_s)
    user = token && token.user

    render json: {message: 'Invalid API Token'}, status: 401 if !user

    @current_user ||= user
  end
end