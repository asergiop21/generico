class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :price_cost, :precision => 8, :scale =>2 
      t.decimal :percentaje
      t.decimal :price_total, :precision => 8, :scale =>2

      t.timestamps
    end
  end
end
