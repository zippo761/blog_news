class UserMailer < ApplicationMailer
  default from: "Kit@blog.test"
  layout 'user_mailer'

  def welcome_email
    @user = params[:user]
    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Добро пожаловать Kit-blog.test',
      )
  end

  def daily_email
    @user = params[:user]
    @posts = params[:posts]

    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Ежедневная рассылка Kit-blog.test',
      )
  end


  def weekly_email
    @user = params[:user]
    @posts = params[:posts]

    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Еженедельная рассылка Kit-blog.test',
      )
  end
end
