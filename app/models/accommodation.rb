class Accommodation < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :reservations

  validates :available_beds, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :has_wifi, inclusion: { in: [true, false] }
  validates :welcome_message, presence: true
end
