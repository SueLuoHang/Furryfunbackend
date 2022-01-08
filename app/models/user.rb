class User < ApplicationRecord
  # acts_as_token_authenticatable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :pets
end
