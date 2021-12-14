require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    Article.create(title: "One", author: "Lucy", content: "content one")
    Article.create(title: "Two", author: "Jimmy", content: "content two")
    Article.create(title: "Three", author: "Lily", content: "content three")
    Article.create(title: "Four", author: "Lone", content: "content four")
  end

  context 'search by title or author' do

    it 'should return empty array if given term is nil' do
      keyword = nil
      articles = Article.search_by_title_or_author keyword
      expect(articles).to eq([])
    end

    it 'should return empty array if given term is empty' do
      keyword = ""
      articles = Article.search_by_title_or_author keyword
      expect(articles).to eq([])
    end

    it 'should return by order with created_at DESC' do
      keyword = "T"
      articles = Article.search_by_title_or_author keyword
      expect(articles.size).to eq(2)
      expect(articles.first.title).to eq("Three")
      expect(articles.second.title).to eq("Two")
    end

    it 'should return all items whose title or author matched given term' do
      keyword = "one"
      articles = Article.search_by_title_or_author keyword
      expect(articles.size).to eq(2)
      expect(articles.first.author).to eq('Lone')
      expect(articles.second.title).to eq('One')
    end

  end

  context "callbacks" do
    it 'should set views count to 0 once created' do
      expect(Article.first.views_count).to eq(0)
    end
  end
end
