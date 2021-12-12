class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    def self.search_by_title(search_term)
        return [] if search_term.blank?
        where("title ILIKE ?", "%#{search_term}%").order("created_at DESC")
    end
end
