Rails.application.routes.draw do
  post '/login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :leaderboards, only: [:index,:create,:destroy]
      resources :users do
      resources :scores, only:[:index,:create] do
        collection do
          get 'highest', to: "scores#highest"
        end
      end
    end
    end
  end
end
