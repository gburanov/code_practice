Rails.application.routes.draw do
  resources :bookmarks, except: [:delete, :destroy]

  root 'bookmarks#index'
end
