class Service < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  # validates :category, inclusion: { in: %w(modelling therapy daily_care pet_boarding),
  # message: "%{value} seems wrong"}
  has_many :bookings
  has_many_attached :photos
end
