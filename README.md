Link on Heroku => https://radiant-cliffs-02115.herokuapp.com/

Requirements :
Ruby on Rails 7.0.3
Ruby 3.1.2
Redis 7.0.2

# Prepare for start server:

## Install gems without pg 
$ bundle config set --local without production 
## Install gems 
$ bundle install
```

## Migrate data base
$ rake db:migrate
```

## Start redis server
$ redis-server
```

## Create admin account:
#### first admin: name: 'Администратор 1' Email: admin@test.com, password: password123
#### second admin: name: 'Администратор 2', Email: admin_2@test.com, password: password123
#### third admin: name: 'Администратор 3', Email: admin_3@test.com, password123
$ rake db:seed
```

## For start tests.
The tests by default use :selenium_chrome driver <br>
$ rake db:seed RAILS_ENV=test
```

## Start server 
$ rails s
```

# Description:
### Welcome, daily, weekly email send only in test.
If u want to see that email was send,  use =>  <em>Sidekiq</em>

1) start <em>Sidekiq</em> to see  when email was send <br>
$ sidekiq -C config/sidekiq.yaml 
```

2) Visit http://127.0.0.1:3000/jobs/  for see control panel (only for admin). 

### Edit post.
Edit post can only current user or  admin, if someone start edit post, another user cant edit post and
must wait until first user not click on cancel or updated post.
