# README

How to run:

* Run `bundle install` in project folder

* In psql create `save_a_train` user with `save_a_train` password (`CREATE USER save_a_train SUPERUSER PASSWORD 'save_a_train';`)

* Run `rails db:create db:migrate db:seed`

* Run rails server `bundle exec rails s`

* Run sidekiq `bundle exec sidekiq`

* Few content objects are provided in `db/seeds.rb` file, bo there is also a rake task (`lib/tasks/generate_content.rake`) in which new content can be added. Commend for running rake task: `bundle exec rake generate:content`

* To run tests: `bundle exec rspec`

* After running a server, the list of all contents can be found at `127.0.0.1:3000/api/v1/contents`
