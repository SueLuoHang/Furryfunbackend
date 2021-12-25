class Service < ApplicationRecord
  belongs_to :pet
  validates :title, :pet_type, :category, presence: true
  validates :category, inclusion: { in: %w(modelling therapy daily_care pet_boarding)}
  has_many :bookings
  has_many_attached :photos
end
