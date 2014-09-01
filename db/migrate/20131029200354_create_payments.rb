class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :customer_id
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end
