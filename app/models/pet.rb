class Pet < ApplicationRecord
  validates :pet_name, :gender, :title, :description, :location, presence: true
  validates :gender, inclusion: { in: %w(female male)}
  validates :pet_type, inclusion: { in: %w(Dog Cat Others)}
  has_one_attached :photo
  has_many :bookings, dependent: :delete_all
  belongs_to :user
end
