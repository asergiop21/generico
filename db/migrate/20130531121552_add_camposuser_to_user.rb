class AddCamposuserToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :cuit, :string
    add_column :users, :dni, :string
    add_column :users, :enabled, :boolean
  end
  def self.down
    remove_column :users, :cuit, :string
    remove_column :users, :dni, :string
    remove_column :users, :enabled, :boolean
  end

end
