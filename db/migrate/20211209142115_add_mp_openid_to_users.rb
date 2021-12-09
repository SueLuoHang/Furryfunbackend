class AddMpOpenidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mp_openid, :string
  end
end
