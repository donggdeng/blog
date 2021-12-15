class MoveContentToActionTextStorage < ActiveRecord::Migration[6.1]
  def change
    Article.all.each do |article|
      article.content = article.legacy_content
      article.save
    end
  end
end
