TagsAppAdmin::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :create]
      resources :tags, only: [:index, :create]
    end
  end

  resources :healthcheck, only: :index
end
