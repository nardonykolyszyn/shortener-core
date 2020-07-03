# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :shortened_url do
    url { Faker::Internet.url(host: 'google.com', scheme: 'https', path: nil) }

    trait :with_invalid_url do
      url { Faker::Internet.url(host: 99) }
    end

    trait :with_no_scheme do
      url { Faker::Internet.url(scheme: nil) }
    end

    trait :with_unavailable_url do
      url { Faker::Internet.url(host: 'website.bit', scheme: 'http') }
    end

    trait :with_empty_url do
      url { nil }
    end
  end
end
