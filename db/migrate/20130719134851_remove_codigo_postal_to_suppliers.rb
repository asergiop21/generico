class RemoveCodigoPostalToSuppliers < ActiveRecord::Migration
  def self.up
    remove_column :suppliers, :zipcode
  end

  def self.down
    add_column :suppliers, :zipcode, :string
  end
end
