class RemoveCategoryfromArticle < ActiveRecord::Migration[5.2]
  def change
    remove_column :article, :category
  end
end
