Rails.application.routes.draw do
  post '/join' => 'parts#create', as: :join
  root 'welcome#index'
end
