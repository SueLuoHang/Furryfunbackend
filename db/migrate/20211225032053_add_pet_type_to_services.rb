class AddPetTypeToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :pet_type, :string
  end
end
