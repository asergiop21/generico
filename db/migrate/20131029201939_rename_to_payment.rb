class RenameToPayment < ActiveRecord::Migration
  def up
      rename_column :payments, :customer_id, :invoice_id


  end

  def down
      rename_column :payments, :invoice_id, :customer_id
  end
end
