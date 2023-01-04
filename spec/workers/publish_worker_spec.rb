# frozen_string_literal: true

require "rails_helper"
require "sidekiq/testing"

Sidekiq::Testing.fake!

RSpec.describe PublishWorker, type: :worker do
  subject(:worker) { described_class }

  let!(:content_1) { create(:content, :draft, published_date: DateTime.current + 1.year) }
  let!(:content_2) { create(:content, :draft, published_date: DateTime.current - 5.minutes) }

  context "when performed" do
    it "job is in correct queue" do
      described_class.perform_async
      assert_equal :default, described_class.queue.to_sym
    end

    it "goes into the jobs array" do
      expect { worker.perform_async }.to change(worker.jobs, :size).by(1)
    end

    it "does not update content status with publish date in the future" do
      expect { worker.new.perform }.not_to change { content_1.reload.status }
    end

    it "updates content status with publish date in the past" do
      expect { worker.new.perform }.to change { content_2.reload.status }.from(Content::DRAFT).to(Content::PUBLISHED)
    end
  end
end
