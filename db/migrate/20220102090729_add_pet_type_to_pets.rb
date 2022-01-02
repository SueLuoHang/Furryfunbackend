class AddPetTypeToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :pet_type, :string
  end
end
