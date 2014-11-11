module Api
  module V1
    class SportsController < BaseController
      def index
        @sports = Sport.page(page).per(per_page)

        render json: @sports, status: :ok, each_serializer: SportSerializer
      end

      def show
        @sport = Sport.find_by_id(params[:id])

        if !@sport
          render json: {message: 'Invalid id'}, status: :not_found
        else
          render json: @sport, serializer: SportSerializer
        end
      end
    end
  end
end