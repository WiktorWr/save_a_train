# frozen_string_literal: true

class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.datetime :published_date, null: false
      t.string :author, null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.enum :status, enum_type: :status, null: false

      t.index :status

      t.timestamps
    end
  end
end
