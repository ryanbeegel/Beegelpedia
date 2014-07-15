Beegelpedia::Application.routes.draw do
 resources :wikis

  root to: 'welcome#index'
end