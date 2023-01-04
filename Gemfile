# frozen_string_literal: true

source "https://rubygems.org"

gem "bootsnap", ">= 1.4.2", require: false
gem "dry-validation"
gem "lograge"
gem "mini_racer"
gem "oj"
gem "pagy"
gem "pg"
gem "puma"
gem "rack-cors", require: "rack/cors"
gem "rails"
gem "redis"
gem "safely_block"
gem "sprockets-rails"
gem "sentry-rails"
gem "sentry-ruby"
gem "sentry-sidekiq"
gem "sidekiq", "< 7"
gem "sidekiq-cron"
gem "sidekiq-unique-jobs"

group :development do
  gem "active_record_query_trace"
  gem "annotate", git: "https://github.com/ctran/annotate_models.git"
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "database_consistency"
  gem "factory_trace"
  gem "fasterer"
  gem "letter_opener"
  gem "letter_opener_web", "~> 1.0"
  gem "mina"
  gem "overcommit"
  gem "rails_best_practices"
  gem "rails-erd"
  gem "relaxed-rubocop"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "traceroute"
end

group :test do
  gem "database_cleaner"
  gem "database_cleaner-active_record"
  gem "rspec_junit_formatter"
  gem "simplecov", require: false
  gem "simplecov-cobertura", require: false
  gem "timecop"
end

group :development, :test do
  gem "bullet"
  gem "byebug"
  gem "listen"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "spring"
  gem "spring-watcher-listen"
end

group :development, :test, :staging do
  gem "amazing_print"
  gem "apitome"
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec_api_documentation"
end
