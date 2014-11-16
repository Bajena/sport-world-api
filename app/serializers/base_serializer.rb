class BaseSerializer < ActiveModel::Serializer
  def includes
    includes = @options[:includes] || {}
  end
end