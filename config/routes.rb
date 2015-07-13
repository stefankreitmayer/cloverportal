Rails.application.routes.draw do
  resources :groups, only: [:create]
  get '/lead' => 'groups#lead', as: :lead
  post '/join' => 'parts#create', as: :join
  post '/logout' => 'groups#logout', as: :logout
  root 'welcome#index'
end
