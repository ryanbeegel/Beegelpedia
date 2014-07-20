Beegelpedia::Application.routes.draw do
  
  devise_for :users
    resources :users, only: [:update]
  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end
  resources :charges, only: [:new, :create]
  root to: 'welcome#index'
end