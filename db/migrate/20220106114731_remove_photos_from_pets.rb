class RemovePhotosFromPets < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :photos, :string
  end
end
