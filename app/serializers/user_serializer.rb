class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :surname, :email, :birth_date, :weight, :height
end