class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :code
  has_many :trips
end
