class UserMailer < ApplicationMailer
  default from: 'info@blog-digest.test'
  layout 'user_mailer'

  def welcome_email
    @user = params[:user_id]

    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Добро пожаловать Blog-Digest.test!',
      )
  end

  def daily_digest_email
    @user = params[:user]
    @posts = params[:post]
    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Ежедневная рассылка Blog-Digest.test',
      )
  end

  def weekly_digest_email
    @user = params[:user]

    @till_date = Time.parse("07:00") - 1  # сегодня
    @from_date = @till_date - 1.week + 1

    @posts = Post.where(created_at: @from_date..@till_date)

    mail(
      to: @user.email,
      # from: 'from@example.com',
      subject: 'Еженедельная рассылка Blog-Digest.test',
      )
  end
end
