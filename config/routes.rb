Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :user_comments, only: [:index]
    get "photo" => "users#photo"
  end
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  get 'searches' => 'posts#search'
end
