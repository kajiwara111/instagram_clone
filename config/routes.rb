Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :feeds do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: %i[create destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
