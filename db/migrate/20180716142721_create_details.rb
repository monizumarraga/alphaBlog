class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.text :welcome
      t.text :aboutMe
      t.text :profile
      t.integer :user_id

      t.timestamps
    end
  end
end
