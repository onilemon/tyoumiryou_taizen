Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    post "use" => "uses#use"
    post "attention" => "attentions#attention"

    get "search" => "searches#search"
    get "/about" => "homes#about"
    get "/users/unsubscribe" => "users#unsubscribe"
    patch "/users/withdrawal" => "users#withdrawal"
    resources :items do
      resource :attentions, only: [:destroy]
    end
    resources :posts, only: [:create, :index]
    get "post/:item_id" => "posts#new", as: "new_post"
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
    root to: 'users#index'
    resources :items
    resources :genres, only: [:create, :index, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy]
  end
end
