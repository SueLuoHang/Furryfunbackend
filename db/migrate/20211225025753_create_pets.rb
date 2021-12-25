class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.string :description
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
