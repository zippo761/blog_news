class Comment < ApplicationRecord
  belongs_to :post

  validates :username, presence: true, length: {in: 1..100}
  validates :content, presence: true, length: {in: 1..200}
end
