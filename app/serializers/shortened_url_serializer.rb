# frozen_string_literal: true

class ShortenedUrlSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :title, :unique_key, :counter

  attribute :shortened_url do |obj|
    obj.shortened_url
  end
end
