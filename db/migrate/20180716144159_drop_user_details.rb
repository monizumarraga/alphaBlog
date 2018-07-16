class DropUserDetails < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_details
  end
end
