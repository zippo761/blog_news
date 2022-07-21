Requirements :
Ruby on Rails 7.0.3
Ruby 3.1.2

Prepare for start:

Install gems without pg
1) bundle config set --local without production

Install gems
2) bundle install

Create admin account. Email: admin@test.com, password: password123
3) bin/rails db:seed

For start tests.
4) rake db:seed RAILS_ENV=test 

Start server
5) rails s

CronJob(welcome, daily, weekly) work only in test.

Sidekiq url /jobs, only for admin. 

Blog don't finish yet.
