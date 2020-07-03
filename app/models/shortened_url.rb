# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  # Set default primary key
  self.primary_key = :unique_key
  # Callbacks
  after_initialize :sanitize_url
  around_create    :generate_title_and_unique_key
  # Validations
  validates :url, presence: true

  def sanitize_url
    # In case procotol is not specified, it appends HTTP by default.
    self.url = Shortener.clean_url(url)
  end

  def shortened_url
    URI::HTTPS.build(host: ENV['APP_HOST'], path: "/#{unique_key}").to_s
  end

  def increment_usage_counter
    self.class.increment_counter(:counter, id)
  end

  def generate_title_and_unique_key
    # NOTE: This can be handled by a retries counter to avoid infite loops.
    self.unique_key = loop do
      random_token = Shortener.generate_option_key
      break random_token unless self.class.exists?(unique_key: random_token)
    end
    yield
    set_url_title
  end

  def set_url_title
    self.title = begin
                   URI.open(url) do |res|
                     Nokogiri::HTML(res).at_css('title').text
                   end
                 rescue OpenURI::HTTPError => e
                   e.message
                 end
  end
end
