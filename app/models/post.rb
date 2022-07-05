class Post < ApplicationRecord
  validates :title, presence: true, length:  {in: 5..200}
  validates :content, presence: true, length:  {minimum: 5}
end
