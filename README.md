Requirements :
Ruby on Rails 7.0.3
Ruby 3.1.2

Prepare for start:

1) bin/rails db:seed
It create admin account.

2) bundle config set --local without production 
Install gem without pg

3) bundle install
Install gems

4) rake db:seed RAILS_ENV=test
For start tests right 

5) rails s
Start server
