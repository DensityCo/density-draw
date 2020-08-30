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
          get :my_question
        end
      end

      resources :answers

      resources :questions do
        member do
          put :image
          put :answer
        end
      end
      
    end
  end

  root to: "home#login"
end
