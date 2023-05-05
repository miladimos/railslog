class Post < ApplicationRecord
    # has_one_attached :thumbnail
    has_rich_text :content

    has_many :comments, dependent: :destroy

    validates :title, presents: true, length: { minimum: 3}
    validates :content, presence: true, length: { minimum: 10 }

    scope :sorted, => { order(arel_table(:published_at).desc.nulls_last).order(updated_at: :desc) }
    scope :draft, => { where(published_at: nil) }
    scope :published, => { where("published_at <= ?", Time.current) }
    scope :scheduled, => { where("published_at > ?", Time.current) }

    def draft?
        published_at.nil?
    end

    def published?
        published_at? && published_at <= Time.current
    end

    def scheduled?
        published_at? && published_at > Time.current
    end

end
