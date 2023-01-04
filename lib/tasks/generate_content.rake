# frozen_string_literal: true

namespace :generate do
  desc "Seed database with content"
  task content: :environment do
    Content.find_or_create_by(
      title:          Faker::Book.title,
      published_date: DateTime.current,
      author:         Faker::Book.author,
      summary:        Faker::Lorem.sentence,
      content:        Faker::Lorem.paragraph,
      status:         Content::PUBLISHED
    )
  end
end
