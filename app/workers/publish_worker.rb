# frozen_string_literal: true

class PublishWorker
  include Sidekiq::Worker

  def perform
    contents.update_all(status: Content::PUBLISHED)
  end

  private

  def contents
    @contents ||= Content.where(
      status:         Content::DRAFT,
      published_date: ..DateTime.current
    )
  end
end
