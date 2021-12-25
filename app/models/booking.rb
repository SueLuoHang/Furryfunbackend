class Booking < ApplicationRecord
  validates :status
  belongs_to :user
  belongs_to :service
end
