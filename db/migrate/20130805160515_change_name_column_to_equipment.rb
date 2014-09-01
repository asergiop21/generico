class ChangeNameColumnToEquipment < ActiveRecord::Migration

  def up
    rename_column :equipments, :category_id, :user_id
  end

  def down
    rename_column :equipments, :user_id, :category_id
  end

end
