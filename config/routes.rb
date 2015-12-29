Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'home#index'

  resources :heroes do
    resources :rel_hero_divides do
      resources :item_sets do
        resources :rel_set_items
      end
    end
    resources :rel_hero_grown_levels
    resources :skills
  end

  resources :divides do
    resources :rel_hero_divides
  end

  resources :blogs

  resources :items
  get '/:format/items', :to => 'items#index'
end
