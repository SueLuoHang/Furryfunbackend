class Pet < ApplicationRecord
  validates :pet_name, :gender, :description, :location, :title, presence: true
  validates :gender, inclusion: { in: %w(female male)}
  validates :pet_type, inclusion: { in: %w(dog cat others)}
  has_many :services
  belongs_to :user
end
