class Addphotostopeets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :photos, :string
  end
end
