# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shortened_urls, except: %i[show]
    end
  end

  get "/:unique_key", to: 'api/v1/shortened_urls#show'
end
