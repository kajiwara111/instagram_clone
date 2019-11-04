Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
