class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all

  validates :title, presence: true, length: {in: 5..200}
  validates :content, presence: true, length: {minimum: 5}
end
