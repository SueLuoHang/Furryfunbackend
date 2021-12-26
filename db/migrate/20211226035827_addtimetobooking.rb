class Addtimetobooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :time, :string
  end
end
