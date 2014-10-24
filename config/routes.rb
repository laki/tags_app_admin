TagsAppAdmin::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end

  resources :healthcheck, :only => [:index]
end
