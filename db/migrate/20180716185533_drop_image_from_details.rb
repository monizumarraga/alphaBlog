class DropImageFromDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column  :details, :image_file_name, :string
    remove_column  :details, :image_content_type, :string
    remove_column  :details, :image_file_size, :string
    remove_column  :details, :image_updated_at, :string
  end
end
