namespace :sample do
  desc 'saying hi to cron'
  task :test => [ :environment ] do
    DigestMailingJob.perform_later
  end
end