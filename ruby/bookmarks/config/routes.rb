# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bookmarks, except: %i[delete destroy]

  root 'bookmarks#index'
  post '/search', to: 'search#search'
end
