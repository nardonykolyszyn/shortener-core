# frozen_string_literal: true

module Shortener
  module Support
    CHARSET = {
      alpha_numeric: ('a'..'z').to_a + (0..9).to_a,
      alpha_numeric_case: ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
    }.freeze

    def self.key_chars
      charset.is_a?
    end
  end
end
