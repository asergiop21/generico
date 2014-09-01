class RemovePhonesIdToCustomers < ActiveRecord::Migration
  def up
    remove_column :customers, :phones_id
  end

  def down
    add_column :customers, :phones_id, :integer
  end
end
