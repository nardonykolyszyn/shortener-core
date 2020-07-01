# frozen_string_literal: true

module Api
  module V1
    # ActionController::Metal provides a minimalist ActionController interface.
    class ShortenerUrlsController < ActionController::Metal
      include ActionController::StrongParameters
      include ActionController::Redirecting
      include ActionController::Instrumentation

      # GET /api/v1/shortened_urls
      def index
      end

      # POST /api/v1/shortened_urls
      def create
      end

      # GET /api/v1/shortened_urls/:unique_key
      def show
        redirect_to url
      end

      # DELETE /api/v1/shortened_urls/:unique_key
      def destroy
      end

      private

      def shortened_urls
        params.require(:shortened_url).permit(:url, :unique_key)
      end
    end
  end
end
