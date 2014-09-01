class AddIdcategoriaToModels < ActiveRecord::Migration
  def change
    add_column :models, :category_id, :integer, :null => false
    add_index :models, :category_id
  end
end
