# frozen_string_literal: true

class AddStatusEnum < ActiveRecord::Migration[7.0]
  def change
    create_enum :status, [
      "draft",
      "published"
    ]
  end
end
