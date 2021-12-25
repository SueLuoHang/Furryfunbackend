class Pet < ApplicationRecord
  validates :pet_name, :gender, :description, :location, presence: true
  validates :gender, inclusion: { in: %w(female male)}
  has_many :services
  belongs_to :user
end
