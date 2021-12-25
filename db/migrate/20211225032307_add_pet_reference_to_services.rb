class AddPetReferenceToServices < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :pet, foreign_key: true
  end
end
