Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books,only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:edit, :update, :show, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings',as: 'followings'
    get 'followers' => 'relationships#followers',as: 'followers'
  end
  get 'search' => 'searches#search'

end
