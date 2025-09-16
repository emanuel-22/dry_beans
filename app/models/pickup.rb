class Pickup < ApplicationRecord

  belongs_to :trip

  # enum status: { pending: 0, in_transit: 1, completed: 2, failed: 3 }
  enum :status, { pending: 0, in_transit: 1, completed: 2, failed: 3 }


  # helper to mark completed
  def mark_completed!(attrs = {})
    update(
      status: :completed,
      completed_at: Time.current,
      **attrs.slice(:signature_url, :photo_url, :latitude, :longitude, :recipient_name, :recipient_document, :notes)
    )
  end

end
