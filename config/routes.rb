TagsAppAdmin::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :tags
    end
  end

  resources :healthcheck, :only => [:index]
end
