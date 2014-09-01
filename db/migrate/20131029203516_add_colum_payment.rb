class AddColumPayment < ActiveRecord::Migration
  def up
    add_column :payments, :customer_id, :integer

  end

  def down
    remove_column :payments, :customer_id

  end
end
