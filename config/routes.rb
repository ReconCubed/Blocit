Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]
  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]
  end
  resources :posts, only: [] do
  resources :comments, only: [:create, :destroy]
  post '/up-vote' => 'votes#up-votes', as: :up_vote
  post '/down-vote' => 'votes#dowm-votes', as: :down_vote
  end
get 'about' => 'welcome#about'
  root to: 'welcome#index'
  
end
