class Trip < ApplicationRecord

  belongs_to :route
  has_many :deliveries, dependent: :destroy
  has_many :pickups, dependent: :destroy


  enum :status, { active: 0, cancelled: 1 }



end
