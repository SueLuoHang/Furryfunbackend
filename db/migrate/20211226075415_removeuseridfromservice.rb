class Removeuseridfromservice < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :user_id
  end
end
