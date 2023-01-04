# frozen_string_literal: true

require "sidekiq"
require "sidekiq/web"
require "sidekiq/cron/web"

REDIS_URL = ENV.fetch("REDIS_URL", "redis://redis:6379/1")

Sidekiq.configure_server do |config|
  config.redis = { url: REDIS_URL }
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL }
end

unless Rails.env.test?
  schedule_file = Rails.root.join("config", "schedule.yml")

  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file)
end
