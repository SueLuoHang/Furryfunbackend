class Booking < ApplicationRecord
  validates :status, inclusion: { in: %w(pending confirmed busy completed) }
  belongs_to :user
  belongs_to :pet
end
