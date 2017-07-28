Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors, defaults: {format: :json} do
        resources :books, shallow: true
      end
    end
  end
end
