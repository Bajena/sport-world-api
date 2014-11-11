module Api
  module V1
    class BaseController < ApplicationController
      DEFAULT_PER_PAGE = 25

      def default_serializer_options
        {root: false}
      end

      def per_page
        params[:per_page] || DEFAULT_PER_PAGE
      end

      def page
        params[:page] || 1
      end
    end
  end
end