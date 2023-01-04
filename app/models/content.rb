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
class Content < ApplicationRecord
  DRAFT     = "draft"
  PUBLISHED = "published"

  STATUSES = {
    draft:     DRAFT,
    published: PUBLISHED
  }.freeze

  enum status: STATUSES
end
