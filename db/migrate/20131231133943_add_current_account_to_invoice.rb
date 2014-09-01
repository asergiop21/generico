class AddCurrentAccountToInvoice < ActiveRecord::Migration
  def self.up
          add_column :invoices, :current_account, :boolean, default: false
  end


  def self.down
          remove_column :invoices, :current_account
  end

end
