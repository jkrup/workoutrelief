class AddIsTutorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isTutor, :boolean
  end
end
