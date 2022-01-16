class AddPhotoToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :photo, :string
  end
end
