class RenameContentToLegacyContent < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :content, :legacy_content
  end
end
