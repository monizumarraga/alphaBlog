class AddUserIdYoArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :date, :text
    add_column :articles, :user_id, :integer
  end
end
