module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: {message: 'all'}
      end

      def show
        if params[:id].to_i < 0
          render json: {message: 'Invalid id'}, status: :not_found
        else
          render json: {message: 'Found'}, status: :ok
        end
      end

      def profile
        if !@current_user
          render json: {message: 'Bad user'}, status: :not_found
        else
          render json: @current_user, except: [:password_digest, :created_at, :updated_at],  status: :ok
        end
      end
    end
  end
end