class Service < ApplicationRecord
  belongs_to :pet
  validates :title, :category, presence: true
  validates :category, inclusion: { in: %w(modelling therapy daily_care pet_boarding)}
  validates :pet_type, inclusion: { in: %w(dog cat others)}
  has_many :bookings
  has_many_attached :photos
end
