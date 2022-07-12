class WeeklyDigestMailingJob < DigestMailingJob
  def do_mailing(p_user, p_posts)
    # TODO: для deliver_later необходимо передавать сериализуемый объект (не ActiveRecord::Relation)
    UserMailer.with(user: p_user, posts: p_posts).weekly_digest_email.deliver_now
  end

  def perform
    super

    @subscr_type = 'weekly'
    @till_date = Time.parse('07:00') - 1 # сегодня
    @from_date = @till_date - 1.weeks + 1

    @users = User.where(subscription_type: @subscr_type)
    @posts = Post.where(created_at: @from_date..@till_date)

    @users.each do |r|
      do_mailing(r, @posts) unless @posts.empty? # abstract do_mailing
    end
  end
end
