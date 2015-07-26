Rails.application.routes.draw do
  resources :groups, only: [:create]
  post '/take_part' => 'parts#create', as: :create_part
  post '/create_group' => 'leads#create', as: :create_lead
  post '/login_group' => 'leads#login', as: :login_lead
  root 'welcome#index'
end
