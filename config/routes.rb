Rails.application.routes.draw do
  resources :groups, only: [:create]
  post '/take_part' => 'part#create', as: :create_part
  post '/create_group' => 'lead#create', as: :create_lead
  post '/login_group' => 'lead#login', as: :login_lead
  post '/logout' => 'session#logout', as: :logout
  root 'welcome#index'
end
