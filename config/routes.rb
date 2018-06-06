Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts

  get 'about', to: 'static#about'
end
