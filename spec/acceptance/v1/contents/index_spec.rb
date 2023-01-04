# frozen_string_literal: true

require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Contents" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"

  get "/api/v1/contents" do
    context "200" do
      example_request "Get all published contents [SUCCESS]" do
        expect(status).to eq 200
      end
    end
  end
end
