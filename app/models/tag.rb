class Tag < ApplicationRecord
    validates :name, presents: true, length: { minimum: 3 }
end
