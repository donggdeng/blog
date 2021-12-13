class Article < ApplicationRecord
    attribute :views_count, default: 0

    validates :title, presence: true
    validates :content, presence: true

    def self.search_by_title(search_term)
        return [] if search_term.blank?
        where("title ILIKE ?", "%#{search_term}%").order("created_at DESC")
    end

    def increase_views_count
        self.views_count = 0 if self.views_count.nil?
        self.views_count += 1
        self.save
    end
end
