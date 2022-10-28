Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about"
    get "/users/unsubscribe" => "users#unsubscribe"
    patch "/users/withdrawal" => "users#withdrawal"
    resources :items
    resources :posts
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres, only: [:create, :index, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy]
  end
end
