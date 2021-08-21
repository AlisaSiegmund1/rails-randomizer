Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'group', to: 'pages#group'
  get 'order', to: 'pages#order'
  get 'pick', to: 'pages#pick'
  get 'surprise', to: 'pages#surprise'

  resources :teams do
    resources :members, only: [:new, :create, :update, :destroy]
  end

  resources :selections, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
