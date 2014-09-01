class ChangeQuantityDefaultToArticles < ActiveRecord::Migration
  def up
     change_column :articles, :quantity, :decimal, :precision => 8, :scale =>2,  :default => '1' 

  end

  def down

     change_column :articles, :quantity, :decimal, :precision => 8, :scale =>2 
  end
end
