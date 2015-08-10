Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
      resources :comments, only: [:create]
  end
get 'about' => 'welcome#about'
  root to: 'welcome#index'

end
