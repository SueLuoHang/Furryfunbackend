class User < ApplicationRecord
  has_many :bookings
  has_many :pets
end
