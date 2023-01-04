# frozen_string_literal: true

module Contents
  module UseCases
    module GetAll
      class Published
        def call
          fetch_published_content
        end

        private

        def fetch_published_content
          Content.where(status: Content::PUBLISHED)
        end
      end
    end
  end
end
