class TripSerializer < ActiveModel::Serializer
  attributes :id, :driver_name, :vehicle_plate, :started_at, :ended_at, :status
  has_many :stops
end
