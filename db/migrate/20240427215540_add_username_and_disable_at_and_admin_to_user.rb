class AddUsernameAndDisableAtAndAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :disable_at, :datetime
    add_column :users, :admin, :boolean, default: false
  end
end
