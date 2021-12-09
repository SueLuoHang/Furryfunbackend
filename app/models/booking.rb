class Booking < ApplicationRecord
  validates :status, inclusion: { in: %w(complete incomplete) }
  belongs_to :user
  belongs_to :service
end
