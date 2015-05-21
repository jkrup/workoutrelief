class RemoveIsTutorFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :isTutor
  end

  def down
  end
end
