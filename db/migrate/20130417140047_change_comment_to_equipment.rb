class ChangeCommentToEquipment < ActiveRecord::Migration
  def up
    change_column :equipments, :comment, :text
  end

  def down
    change_column :equipments, :comment, :text
  end
end
