class AddViewsCountToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :views_count, :integer
  end
end
