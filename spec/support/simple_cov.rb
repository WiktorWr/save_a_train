# frozen_string_literal: true

if Rails.env.test?
  require "simplecov"
  require "simplecov-cobertura"

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::CoberturaFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  )

  SimpleCov.start "rails" do
    add_filter "/app/models/"
    add_filter "/app/jobs/application_job.rb"
    add_filter "/app/lib/representer.rb"
    add_filter "/lib/tasks/bundler_audit.rake"
    add_filter "/lib/tasks/auto_annotate_models.rake"
  end
end
