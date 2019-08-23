Rails.application.routes.draw do
  devise_scope :store do
    authenticated :store do
      root :to => 'products#index', as: :authenticated_root
    end
    unauthenticated :store do
      root :to => 'users#index', as: :unauthenticated_root
    end
  end

  devise_for :stores
  resources :stores, only:[:index, :show]
  resources :products
  resources :order_slips, only:[:index, :update]
  resources :number_purchases, only:[:index, :show]
  resources :users do
    collection do
      get :edit_search
    end
  end
  resources :user_info, only:[:index]
  resources :user_analysis, only:[:index]

  post '/callback' => 'linebot#callback'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
