Rails.application.routes.draw do
  devise_for :stores
  root 'stores#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
