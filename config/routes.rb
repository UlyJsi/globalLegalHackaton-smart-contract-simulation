Rails.application.routes.draw do
  root 'articles#home'

  resources :articles
  resources :transactions
  resources :users, except: [:new] # post "users", to: "users#create" --------> do the same

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new' # build sessions without database 
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get "new-transaction", to: 'transactions#new'

  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
