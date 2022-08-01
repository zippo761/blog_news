class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  enum subscription_type: %i[no daily weekly]

  # TODO if user account was destroy then all posts and comments will destroy too.
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  # length of email can be too long
  validates :email, presence: true, length: { in: 7..30 }

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  after_create :send_welcome_email
  after_initialize :init


  def send_welcome_email
    # TODO when user register account will send email, dont forget start redis-server
    # need change to better place this function
    UserMailer.with(user: self).welcome_email.deliver_later
  end

  def init
    # default subscription type for email will be weekly
    self.subscription_type ||= :weekly
  end
end
