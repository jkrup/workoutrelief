class ChangeTypeOfDetailsOnExercise < ActiveRecord::Migration
  def up
    change_column :exercises, :details, :text
  end

  def down
  end
end
