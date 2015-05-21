class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :bodypart
      t.string :name
      t.string :details
      t.string :youtube
      t.integer :votes

      t.timestamps
    end
    add_index :exercises, :bodypart_id
  end
end
