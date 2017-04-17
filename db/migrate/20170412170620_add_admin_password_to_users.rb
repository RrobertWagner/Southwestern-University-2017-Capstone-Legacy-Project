class AddAdminPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_password, :string
  end
end
