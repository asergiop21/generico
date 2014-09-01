class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
