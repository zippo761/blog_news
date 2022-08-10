class WeeklyDigestMailingJob < DigestMailingJob
  # TODO need refactor this class for make some logic in base class DigestMailingJob

  def do_mailing(user, posts)
    # take arguments:
    # user: user who have subscription type - weekly
    # posts: list of post in last 1 week
    UserMailer.with(user: user, posts: posts).weekly_digest_email.deliver_now
  end

  def perform

    @subscr_type = 'weekly'
    @till_date = Time.parse('07:00') - 1 # сегодня
    @from_date = @till_date - 1.weeks + 1

    @users = User.where(subscription_type: @subscr_type)
    @posts = Post.where(created_at: @from_date..@till_date)

    @users.each do |user|
      do_mailing(user, @posts) unless @posts.empty?
    end
  end
end
