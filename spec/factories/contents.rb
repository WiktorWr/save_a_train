# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id             :bigint           not null, primary key
#  author         :string           not null
#  content        :text             not null
#  published_date :datetime         not null
#  status         :enum             not null
#  summary        :text             not null
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_contents_on_status  (status)
#
FactoryBot.define do
  factory :content do
    author         { Faker::Book.author }
    content        { Faker::Lorem.paragraph }
    published_date { DateTime.current }
    summary        { Faker::Lorem.sentence }
    title          { Faker::Book.title }

    trait :draft do
      status { Content::DRAFT }
    end

    trait :published do
      status { Content::PUBLISHED }
    end
  end
end
