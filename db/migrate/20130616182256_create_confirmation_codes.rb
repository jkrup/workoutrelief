class CreateConfirmationCodes < ActiveRecord::Migration
  def change
    create_table :confirmation_codes do |t|
      t.references :user
      t.string :code

      t.timestamps
    end
    add_index :confirmation_codes, :user_id
  end
end
