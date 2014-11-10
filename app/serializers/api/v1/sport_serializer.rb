module Api
  module V1
    class SportSerializer < ActiveModel::Serializer
      attributes :id, :name, :calories_per_hour
    end
  end
end