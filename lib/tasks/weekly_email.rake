namespace :weekly_email do
  desc 'run'
  task run: [:environment] do
    WeeklyDigestMailingJob.perform_later
  end
end
