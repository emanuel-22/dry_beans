class Delivery < ApplicationRecord
  belongs_to :trip

  enum status: { pending: 'pending', in_transit: 'in_transit', completed: 'completed', failed: 'failed' }

end
