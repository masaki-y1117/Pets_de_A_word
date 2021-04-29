Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:show, :edit, :update, :destroy] do
    get "photo" => "users#photo"
    # ユーザーが全ての投稿写真にしたコメントの一覧ページ
    get "user_comments" => "users#user_comments"
  end
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  get 'searches' => 'posts#search'
end
