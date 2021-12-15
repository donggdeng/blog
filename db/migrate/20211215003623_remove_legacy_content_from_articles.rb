class RemoveLegacyContentFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :legacy_content
  end
end
