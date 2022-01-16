class Changeintegertobiginteger < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone_number, :integer, limit: 8
  end
end
