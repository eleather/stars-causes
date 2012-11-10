StarsCauses::Application.routes.draw do
  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'

  resources :comments

  resources :stars do
    resources :seconds
  end
  resources :user_sessions
  resources :users
  
  root :to => 'stars#index'
end
