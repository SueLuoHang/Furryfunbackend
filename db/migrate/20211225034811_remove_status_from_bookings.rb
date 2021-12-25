class RemoveStatusFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :status, :string
  end
end
