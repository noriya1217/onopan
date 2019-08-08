Rails.application.routes.draw do
  devise_scope :store do
    root "devise/sessions#new"
  end

  devise_for :stores
  resources :stores

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
