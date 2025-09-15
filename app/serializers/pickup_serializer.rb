
class PickupSerializer < ActiveModel::Serializer
  attributes :id, :status, :scheduled_at, :completed_at, :recipient_name, :recipient_document, :photo_url, :latitude, :longitude, :notes, :attempts_number
end
