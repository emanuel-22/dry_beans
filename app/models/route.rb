class Route < ApplicationRecord

  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

end
