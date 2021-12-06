class User < ApplicationRecord
  validates :user_name, :phone_number, presence: true
end
