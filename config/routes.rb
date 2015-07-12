Rails.application.routes.draw do
  resources :groups, only: [:create, :show]
  post '/join' => 'parts#create', as: :join
  root 'welcome#index'
end
