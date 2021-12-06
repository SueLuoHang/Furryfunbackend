class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :phone_number
      t.string :user_name

      t.timestamps
    end
  end
end
