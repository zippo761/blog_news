namespace :daily_email do
  desc 'run'
  task run: [:environment] do
    DailyDigestMailingJob.perform_later
  end
end
