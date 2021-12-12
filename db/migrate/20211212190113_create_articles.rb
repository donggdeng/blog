class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.boolean :is_published
      t.date :publish_date
      t.text :content

      t.timestamps
    end
  end
end
