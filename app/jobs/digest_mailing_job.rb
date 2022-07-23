class DigestMailingJob < ApplicationJob
  queue_as :default

  def perform
    # do something
  end
end
