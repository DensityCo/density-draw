Rails.application.routes.draw do  
  require "sidekiq/web"

  mount ActionCable.server => '/cable'
  mount Sidekiq::Web, at: "/sidekiq"

  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      
      resources :games do
        collection do
          post :code
        end
        member do
          post :start
          get :question
        end
      end

      resources :questions do
        member do
          put :image
        end
      end
      
    end
  end

  root to: "home#health_check"
end
