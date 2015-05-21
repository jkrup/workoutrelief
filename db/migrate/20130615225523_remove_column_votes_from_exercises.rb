class RemoveColumnVotesFromExercises < ActiveRecord::Migration
  def up
    remove_column :exercises, :votes
  end

  def down
  end
end
