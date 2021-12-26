class Booking < ApplicationRecord
  validates :status, inclusion: { in: %w(pending confirmed completed) }
  belongs_to :user
  belongs_to :service
end
