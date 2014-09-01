class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :articles_id
      t.decimal :quantity
      t.decimal :unit_price
      t.decimal :price_total
      t.integer :invoice_id

      t.timestamps
    end
  end
end
