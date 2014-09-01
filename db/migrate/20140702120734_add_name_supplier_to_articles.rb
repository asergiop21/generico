class AddNameSupplierToArticles < ActiveRecord::Migration
  def change
      add_column :articles, :name_supplier, :string
  end
end
