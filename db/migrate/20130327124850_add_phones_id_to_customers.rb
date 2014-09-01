class AddPhonesIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :phones_id, :integer
  end
end
