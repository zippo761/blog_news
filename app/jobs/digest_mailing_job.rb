class DigestMailingJob < ApplicationJob
  queue_as :default

  attr_accessor :subscr_type, :from_date, :till_date

  def perform
    # do something
  end
end
