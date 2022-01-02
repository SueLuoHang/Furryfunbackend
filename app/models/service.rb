class Service < ApplicationRecord
  belongs_to :pet
  validates :category, inclusion: { in: %w(modelling therapy daily_care pet_boarding)}
  has_many :bookings
  has_many_attached :photos
end
