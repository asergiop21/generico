class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.integer :location_id
      t.integer :user_id
      t.string :zipcode

      t.timestamps
    end
  end
end
