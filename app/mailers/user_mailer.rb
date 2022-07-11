class UserMailer < ApplicationMailer
  default from: 'info@blog-digest.test'
  layout 'user_mailer'

  def welcome_email
    @user = params[:user]

    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Добро пожаловать Kit-Blog!',
      )
  end

  def daily_digest_email
    @user = params[:user]
    @posts = params[:posts]

    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Ежедневная рассылка Kit-Blog',
      )
  end

  def weekly_digest_email
    @user = params[:user]
    @posts = params[:posts]

    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Еженедельная рассылка Kit-Blog',
      )
  end
end
