class CreateEquipments < ActiveRecord::Migration
  def change
    create_table :equipments do |t|
      t.string :mac
      t.integer :state
      t.string :comment
      t.integer :category_id
      t.integer :model_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
