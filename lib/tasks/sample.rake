namespace :sample do
  desc 'saying hi to cron'
  task :test => [ :environment ] do
    perform(DigestMailingJob)
  end
end