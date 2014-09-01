class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :lastname, :string
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :role_id, :integer, :references=>"role"

    add_index :users, :role_id

  end
end
