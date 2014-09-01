class ChangeColumnStatusToEquipment < ActiveRecord::Migration
  def self.up
      change_column :equipments, :status, :string, :default => 'STOCK'
      add_column :equipments, :enabled, :boolean, :default => true
  end

  def self.down
      change_column :equipments, :status, :string
      remove_column :equipments, :enabled, :boolean
  end
end
