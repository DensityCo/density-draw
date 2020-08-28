Rails.application.routes.draw do  
  resources :players
  ActiveAdmin.routes(self)
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      
      resources :games do
        collection do
          post :code
        end
      end
      
    end
  end

  root to: "home#health_check"
end
