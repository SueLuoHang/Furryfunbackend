class RemovePetTypeFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :pet_type, :string
  end
end
