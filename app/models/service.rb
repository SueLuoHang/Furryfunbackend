class Service < ApplicationRecord
  belongs_to :pet
  validates :category, presence: true
  validates :category, inclusion: { in: %w(modelling therapy daily_care pet_boarding)}
  has_many :bookings
end
