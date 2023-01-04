# frozen_string_literal: true

module Contents
  module Representers
    class Index < ::Representer
      represent_with :title,
                     :published_date,
                     :author,
                     :summary,
                     :content
    end
  end
end
