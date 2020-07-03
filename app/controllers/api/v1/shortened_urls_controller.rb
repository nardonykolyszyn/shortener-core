# frozen_string_literal: true

module Api
  module V1
    class ShortenedUrlsController < ApiController
      # GET /api/v1/shortened_urls
      def index
        pagy, shortened_urls = pagy(
          ShortenedUrl.all,
          per_page: params[:page],
          items: 10
        )

        render json: {
          data: ShortenedUrlSerializer.new(shortened_urls),
          current_page: pagy.page,
          total_items: pagy.items,
          tota_pages: pagy.pages
        }, status: 200
      end

      # POST /api/v1/shortened_urls
      def create
        shortened_url = ShortenedUrl.new(url: shortened_urls[:url])

        if shortened_url.save
          render json: {
            data: ShortenedUrlSerializer.new(shortened_url)
          }, status: :ok
        else
          render json: {
            errors: shortened_url.errors.full_messages.to_sentence
          }, status: :unprocessable_entity
        end
      end

      # GET /api/v1/shortened_urls/:unique_key
      def show
        shortened_url.increment_usage_counter

        redirect_to shortened_url.url, status: :moved_permanently
      end

      # DELETE /api/v1/shortened_urls/:unique_key
      def destroy
        shortened_url.destroy

        render json: {
          data: {
            message: 'URL wad destroyed successfully'
          }
        }, status: :ok
      end

      private

      def shortened_urls
        params.require(:shortened_url).permit(:url, :unique_key)
      end

      # Nature Rails way to load resouces from Rails 3
      # This method uses Lazy Loading definition
      def shortened_url
        @shortened_url ||= ShortenedUrl.find(params[:unique_key])
      end

      # Ruby Polymorphism: Great example.
      def not_found
        render json: {
          errors: 'URL not found, check your payload'
        }
      end
    end
  end
end
