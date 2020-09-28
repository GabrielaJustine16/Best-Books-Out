class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_books, through: :reviews, source: :book

    has_many :books #they have created

    validates :username, uniqueness: true, presence: true

    has_secure_password
end
