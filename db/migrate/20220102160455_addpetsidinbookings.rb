class Addpetsidinbookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :pet, foreign_key: true
  end
end
