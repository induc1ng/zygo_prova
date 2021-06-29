class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :image, presence: true
    validates :image, format: {with: /\.(png|jpg)\Z/i}
    validates :description, presence: true
end
