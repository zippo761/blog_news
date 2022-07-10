class DigestMailingJob < ApplicationJob
  queue_as :default

  def do_mailing(p_user, p_posts)
    @subscr_type = 'daily'
    @till_date = Time.parse("07:00") - 1  # сегодня
    @from_date = @till_date - 1.day + 1
    # TODO: для deliver_later необходимо передавать сериализуемый объект (не ActiveRecord::Relation)
    UserMailer.with(user: p_user, posts: p_posts).daily_digest_email
  end

  def perform

    @users_for_email = User.where(subscription_type: @subscr_type)

    @posts = Post.where(created_at: @from_date..@till_date)

    @users_for_email.each do |r|
      do_mailing(r, @posts) unless @posts.empty? # abstract do_mailing
    end
  end #/perform
end
