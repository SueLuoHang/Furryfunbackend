class RemoveresetPasswordSentAtfromusers2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :reset_password_sent_at, :datetime
  end
end
