class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :departament
      t.string :zipcode
      t.string :province
      t.string :country

      t.timestamps
    end
  end
end
