module Api
  module V1
    class UsersController < BaseController
      def profile
        if !@current_user
          render json: {message: 'Bad user'}, status: :not_found
        else
          render json: @current_user, serializer: UserSerializer,  status: :ok
        end
      end
    end
  end
end