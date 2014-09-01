class AddCancelarInvoiceToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :cancelar_invoice, :boolean, :default => false
  end


  def self.down
     remove_column :invoices, :cancelar_invoice
  end

end
