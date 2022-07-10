class DigestMailingJob < ApplicationJob
  queue_as :default

  attr_accessor :subscr_type, :from_date, :till_date

  def perform

    @users_for_email = User.where(subscription_type: @subscr_type)

    @posts = Post.where(created_at: @from_date..@till_date)

    @users_for_email.each do |r|
      do_mailing(r, @posts) unless @posts.empty? # abstract do_mailing
    end
  end #/perform
end
