class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :lastname
      t.string :address
      t.string :neighborhood
      t.string :reference_direction
      t.string :email
      t.string :dni
      t.text :description
      t.string :cuit
      t.date :date_of_birth
      t.boolean :removed
      t.string :bar_code
      t.string :category
      t.integer :location_id
      t.integer :user_id
      t.integer :company_id
      t.timestamps
    end
  end
end
