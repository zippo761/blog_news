class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { in: 5..200 }
  validates :content, presence: true, length: { minimum: 5 }
  validates_presence_of :lock_version, on: :update

end
