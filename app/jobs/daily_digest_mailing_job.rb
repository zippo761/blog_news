class DailyDigestMailingJob < DigestMailingJob
  def initialize
    @subscr_type = 'daily'
    @till_date = Time.parse("07:00") - 1  # сегодня
    @from_date = @till_date - 1.day + 1
  end

  def do_mailing(p_user, p_posts)
    # TODO: для deliver_later необходимо передавать сериализуемый объект (не ActiveRecord::Relation)
    UserMailer.with(user: p_user, posts: p_posts).daily_digest_email.deliver_now
  end
end