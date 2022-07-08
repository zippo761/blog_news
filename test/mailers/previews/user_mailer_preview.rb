# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.second).welcome_email
  end


  def daily_email
    UserMailer.with(user: User.first).daily_email
  end


  def weekly_email
    UserMailer.with(user: User.first).weekly_email
  end
end
