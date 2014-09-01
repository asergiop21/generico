class AddStatusToEquipment < ActiveRecord::Migration
  def change
    add_column :equipments, :status, :string
    remove_column :equipments, :state 
  end
end
