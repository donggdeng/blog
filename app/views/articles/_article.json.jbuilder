json.extract! article, :id, :title, :is_published, :publish_date, :content, :created_at, :updated_at
json.url article_url(article, format: :json)
