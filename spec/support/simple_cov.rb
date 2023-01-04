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
    add_filter "/app/controllers/apitome"
    add_filter "/app/controllers/admin"
    add_filter "/app/lib/rpush"
    add_filter "/app/lib/tasks/bundler_audit.rake"
    add_filter "/app/lib/tasks/auto_annotate_models.rake"
    add_filter "/app/dashboards"
  end
end
