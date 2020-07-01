# frozen_string_literal: true

require 'open-uri'

module ShortenerApi
  # Constants
  CHARSET = {
    alpha_num: ('a'..'z').to_a + (0..9).to_a,
    alpha_num_case: ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  }
  # REGEX
  LINK_HAS_PROTOCOL = Regexp.new('\Ahttp:\/\/|\Ahttps:\/\/', Regexp::IGNORECASE)
  # Variables
  mattr_accessor :unique_key_length
  mattr_accessor :charset
  # Setters
  self.unique_key_length = 5
  self.charset = :alpha_num

  # Get current charset.
  # Available options:
  # -> alpha_num
  # -> alpha_num_case
  def self.key_chars
    charset.is_a?(Symbol) ? CHARSET[charset] : charset
  end

  def self.generate_option_key
    (0..unique_key_length).map { key_chars[rand(key_chars.size)] }.join
  end

  def self.clean_url(url)
    url = url.to_s.strip
    url = "http://#{url}" if url !~ LINK_HAS_PROTOCOL && url[0] != '/'

    URI.parse(url).normalize.to_s
  end
end
