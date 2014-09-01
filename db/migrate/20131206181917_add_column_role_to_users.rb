class AddColumnRoleToUsers < ActiveRecord::Migration
  def self.up
        add_column :users, :role, :string
  end

  def self.down
        add_column :users, :role
  end
end
