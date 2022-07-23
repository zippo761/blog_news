class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  # length of content must be between 5 and 200
  validates :title, presence: true, length: { in: 5..200 }
  # minimum length for post 5
  validates :content, presence: true, length: { minimum: 5 }
end
