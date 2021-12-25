class RemoveDescriptionFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :description, :string
  end
end
