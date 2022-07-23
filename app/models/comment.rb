class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # length of comment must be between 1 and 500
  validates :content, presence: true, length: { in: 1..500 }
end
