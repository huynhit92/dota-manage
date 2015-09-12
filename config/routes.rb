Rails.application.routes.draw do

  devise_for :users
  
  root 'home#index'

  resources :rel_hero_divides
  resources :heroes do
    resources :rel_hero_divides
  end
  resources :divides do
    resources :rel_hero_divides
  end

end
