# frozen_string_literal:  true


class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.text :url, null: false, length: 2084
      t.string :title, null: true
      t.integer :counter, null: false, default: 0
      t.string :unique_key, limit: 10, null: false

      t.timestamps
    end

    add_index :shortened_urls, :unique_key, unique: true
    add_index :shortened_urls, :url, length: 2084
  end
end
