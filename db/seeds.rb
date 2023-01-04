# frozen_string_literal: true

# Seed db with published content
3.times do
  Content.find_or_create_by(
    title:          Faker::Book.title,
    published_date: DateTime.current,
    author:         Faker::Book.author,
    summary:        Faker::Lorem.sentence,
    content:        Faker::Lorem.paragraph,
    status:         Content::PUBLISHED
  )
end

# Seed db with draft content
3.times do
  Content.find_or_create_by(
    title:          Faker::Book.title,
    published_date: DateTime.current + rand(5..15).minutes,
    author:         Faker::Book.author,
    summary:        Faker::Lorem.sentence,
    content:        Faker::Lorem.paragraph,
    status:         Content::DRAFT
  )
end
