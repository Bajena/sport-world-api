module Api
  module V1
    class SportsController < ApplicationController
      def index
        render json: {sports: Sport.all}, status: :ok
      end

      def show
        @sport = Sport.find_by_id(params[:id])

        if !@sport
          render json: {message: 'Invalid id'}, status: :not_found
        else
          render json: @sport, status: :ok
        end
      end
    end
  end
end