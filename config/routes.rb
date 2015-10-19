Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :rel_hero_divides

  resources :heroes do
    resources :rel_hero_divides do
      resources :item_sets do
        resources :rel_set_items
      end
    end
    resources :rel_hero_grown_levels
  end
  get 'heroes_list_ajax' => "heroes#list_ajax"

  resources :divides do
    resources :rel_hero_divides
  end
  get 'divides_list_ajax' => "divides#list_ajax"

  resources :items
  get   '/:format/items',               :to => 'items#index'
end
