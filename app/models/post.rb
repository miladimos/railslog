class Post < ApplicationRecord
    has_rich_text :body
    
    has_many :comments, dependent: :destroy

    validates :title, presents: true, length: { minimum: 3}
    validates :body, presence: true, length: { minimum: 10 }

end
