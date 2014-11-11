module Api
  module V1
    class UsersController < BaseController
      skip_before_filter :authenticate_with_token!, only: [:sign_up, :sign_in]

      def profile
        if !@current_user
          render json: {message: 'Bad user'}, status: :not_found
        else
          render json: @current_user, serializer: UserSerializer,  status: :ok
        end
      end

      def sign_up
        user = User.create(params_to_hash(params))

        if user.valid?
          render json: user.auth_token, status: :ok
        else
          render json: user.errors.messages, status: :not_acceptable
        end
      end

      def sign_in
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          user.create_auth_token
          render json: user.auth_token, status: :ok
        else
          render json: 'Invalid credentails', status: :not_acceptable
        end
      end

      private

      def params_to_hash(params)
        {
            email: params[:email],
            password: params[:password],
            name: params[:name],
            surname: params[:surname],
            weight: params[:weight],
            height: params[:height],
            birth_date: params[:birth_date]
        }
      end
    end
  end
end