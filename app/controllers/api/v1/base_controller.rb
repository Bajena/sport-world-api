module Api
  module V1
    class BaseController < ApplicationController
      def default_serializer_options
        {root: false}
      end
    end
  end
end