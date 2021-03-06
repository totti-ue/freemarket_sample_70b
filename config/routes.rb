Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
}

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'

  resources :items do
    collection do
      get 'search'
    end
    resources :likes, only: [:create] do
      member do
        delete 'release', to: 'likes#release'
      end
    end
    member do
      get 'purchase', to: 'items#purchase'
      post 'pay', to: 'items#pay'
      get 'done', to: 'items#done'
    end
  end
  resources :users, only: :show do
    resources :cards, only: [:new, :show] do
      collection do
        post 'pay', to: 'cards#pay'
        post 'delete', to: 'cards#delete'
      end
    end
  end

  resources :categories, only: :index do
    collection do
      get 'get_children', defaults: { format: 'json' }
      get 'get_grandchildren', defaults: { format: 'json' }
    end
  end
  
end
