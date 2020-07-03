# frozen_string_literal: true

Rollbar.configure do |config|
  # Without configuration, Rollbar is enabled in all environments.
  # To disable in specific environments, set config.enabled=false.

  config.access_token = 'eb98432a559a4465b15b4d5aa8a66329'

  # Here we'll disable in 'test':
  config.enabled = false if Rails.env.test?
  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env
end
