class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    before_create :set_views_count

    def self.search_by_title(search_term)
        return [] if search_term.blank?
        where("title ILIKE ?", "%#{search_term}%").order("created_at DESC")
    end

    def increase_views_count
        self.views_count = 0 if self.views_count.nil?
        self.views_count += 1
        self.save
    end

    private

    def set_views_count
        self.views_count = 0
    end
end
