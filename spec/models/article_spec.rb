require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    Article.create(title: "One", content: "content one")
    Article.create(title: "Two", content: "content two")
    Article.create(title: "Three", content: "content three")
  end
  context 'search by title' do

    it 'should return empty array if title is nil' do
      title = nil
      articles = Article.search_by_title title
      expect(articles).to eq([])
    end

    it 'should return empty array if title is empty' do
      title = ""
      articles = Article.search_by_title title
      expect(articles).to eq([])
    end

    it 'should return by order with created_at DESC' do
      title = "T"
      articles = Article.search_by_title title
      expect(articles.size).to eq(2)
      expect(articles.first.title).to eq("Three")
      expect(articles.second.title).to eq("Two")
    end

  end
end
