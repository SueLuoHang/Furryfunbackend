class RemoveserviceIdfrombookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :service_id, :references
  end
end
