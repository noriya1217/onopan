Rails.application.routes.draw do
  devise_scope :store do
    root "devise/sessions#new"
  end

  devise_for :stores
  resources :stores, only:[:index, :show]
  resources :products
  resources :order_slips, only:[:index, :update]

  post '/callback' => 'linebot#callback'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
