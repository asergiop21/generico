class AddColumnCategoryIdToArticle < ActiveRecord::Migration
  def self.up
      add_column :articles, :category_id, :integer
  end


  def self.down
          remove_column :articles, :catergory_id
  end

end
