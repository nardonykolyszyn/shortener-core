# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::Base
      skip_before_action :verify_authenticity_token
      include Pagy::Backend
    end
  end
end
