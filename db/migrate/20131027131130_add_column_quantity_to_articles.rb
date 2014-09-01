class AddColumnQuantityToArticles < ActiveRecord::Migration
  def self.up
          add_column :articles, :quantity, :decimal, :precision => 8, :scale => 2
          add_column :articles, :barcode, :string
          add_column :articles, :articles_code_supplier, :string
          add_column :articles, :supplier_id, :integer
  end


  def self.down
          remove_column :articles, :quantity
          remove_column :articles, :barcode
          remove_column :articles, :articles_code_supplier
          remove_column :articles, :supplier_id
  end


end
