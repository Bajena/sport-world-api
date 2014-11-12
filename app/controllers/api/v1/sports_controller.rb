module Api
  module V1
    class SportsController < BaseController
      def index
        @sports = PaginatingDecorator.decorate(Sport.paginate(page: page, per_page: per_page))
        render json: @sports, status: :ok, serializer: PaginatedSerializer
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