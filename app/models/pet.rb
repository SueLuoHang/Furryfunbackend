class Pet < ApplicationRecord
  validates :pet_name, :gender, :title, :description, :location, presence: true
  validates :gender, inclusion: { in: %w(female male)}
  validates :pet_type, inclusion: { in: %w(dog cat others)}
  has_many :services
  has_one_attached :photo
  belongs_to :user
end
