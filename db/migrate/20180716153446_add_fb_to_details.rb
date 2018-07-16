class AddFbToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :fb, :text
    add_column :details, :instagram, :text
    add_column :details, :linkedin, :text
    add_column :details, :github, :text
  end
end
