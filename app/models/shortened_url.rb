# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  # Callbacks
  before_save   :set_url_title
  around_create :generate_unique_key
  # Validations
  validates :url, presence: true

  def set_url_title
    self.title = begin
                   URI.open(Shortener.clean_url(url)) do |res|
                     Nokogiri::HTML(res).at_css('title').text
                   end
                 rescue OpenURI::HTTPError => e
                   e.message
                 end
  end

  def shortened_url
    URI::HTTP.build(host: ENV['APP_HOST'], path: "/#{unique_key}").to_s
  end

  def generate_unique_key
    self.unique_key = loop do
      random_token = Shortener.generate_option_key
      break random_token unless self.class.exists?(unique_key: random_token)
    end
    yield
  end
end
