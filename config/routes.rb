Rails.application.routes.draw do
  get 'comments/index'
  get 'posts/index'
  get 'posts/show'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts, only: [:index, :create, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:index, :create, :destroy]
    collection do
      get 'search'
    end
  end
  
end
