# frozen_string_literal: true

describe Contents::UseCases::GetAll::Published do
  subject(:get_published) { described_class.new.call }

  let!(:draft_content_1)     { create(:content, :draft) }
  let!(:draft_content_2)     { create(:content, :draft) }
  let!(:published_content_3) { create(:content, :published) }
  let!(:published_content_4) { create(:content, :published) }

  it "returns only only published content" do
    expect(get_published).to match_array([published_content_3, published_content_4])
  end
end
