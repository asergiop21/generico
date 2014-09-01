class AddColumnMakeToArticles < ActiveRecord::Migration
  def self.up
          add_column :articles, :make_id, :integer 
  end
  
  def self.down
          remove_column :articles, :make_id
  end
end
