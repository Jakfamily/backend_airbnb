class City < ApplicationRecord
  has_many :accommodations

  validates :name, presence: true
  validates :zip_code, presence: true, uniqueness: true
end
