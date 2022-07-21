Requirements :
Ruby on Rails 7.0.3
Ruby 3.1.2

Prepare for start:

1) bin/rails db:seed

It create admin account. Email: admin@test.com, password: password123

2) bundle config set --local without production

Install gems without pg

3) bundle install

Install gems

4) rake db:seed RAILS_ENV=test 

For start tests.

5) rails s

Start server


CronJob(welcome, daily, weekly) work only in test.

Sidekiq url /jobs, only for admin. 

Blog don't finish yet.
