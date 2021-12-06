class Service < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :category, inclusion: { in: %w(modeling therapy daily_care pet_boarding),
  message: "%{value} seems wrong"}
end
