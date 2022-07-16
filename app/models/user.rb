class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum subscription_type: %i[no daily weekly]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, length: { in: 7..30 }

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  after_create :send_welcome_email
  after_initialize :init

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_later
  end

  def init
    self.subscription_type ||= :weekly
  end
end
