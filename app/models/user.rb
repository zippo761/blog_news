class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum subscription_type: [:no, :daily, :weekly]

  has_many :posts
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email
  after_initialize :init

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_later
  end

  def init
    self.subscription_type ||= :weekly
  end

end
