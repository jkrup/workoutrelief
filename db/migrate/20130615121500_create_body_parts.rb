class CreateBodyParts < ActiveRecord::Migration
  def change
    create_table :body_parts do |t|
      t.string :name
      t.integer :x1
      t.integer :y1
      t.integer :x2
      t.integer :y2

      t.timestamps
    end
  end
end
