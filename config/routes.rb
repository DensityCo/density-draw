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
          get :question
        end
      end
      
    end
  end

  root to: "home#health_check"
end
