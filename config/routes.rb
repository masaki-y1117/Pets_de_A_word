Rails.application.routes.draw do
  get 'user_comments/index'
  get 'post_comments/index'
  namespace :users do
    get 'comments/index'
  end
  namespace :posts do
    get 'comments/index'
  end
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :user_comments, only: [:index]
    get "photo" => "users#photo"
  end
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :post_comments, only: [:index, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  get 'searches' => 'posts#search'
end
