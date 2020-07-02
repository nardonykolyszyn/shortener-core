# frozen_string_literal: true

module Api
  module V1
    # ActionController::Metal provides a minimalist ActionController interface.
    class ApiController < ActionController::Metal
      include ActionController::StrongParameters
      include AbstractController::Rendering
      include ActionController::Instrumentation
      include ActionController::Rendering
      include ActionController::Renderers::All
      include Pagy::Backend
    end
  end
end
