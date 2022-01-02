class AddTitleToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :title, :string
  end
end
