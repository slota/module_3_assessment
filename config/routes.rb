Rails.application.routes.draw do
  root 'products#index'

  get '/search', to: 'products#index'
  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items
    end
  end

end
