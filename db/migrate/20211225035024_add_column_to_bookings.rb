class AddColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :status, :boolean
  end
end
