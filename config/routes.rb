Rails.application.routes.draw do
  root 'stores#index'

  devise_for :stores
  resources :stores

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
