class RemoveTitleFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :title, :string
  end
end
