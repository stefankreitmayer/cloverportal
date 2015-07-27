Rails.application.routes.draw do
  resources :groups, only: [:create]

  get '/poll_lead' => 'leads#poll', as: :poll_lead
  post '/auto_assign_parts' => 'leads#auto_assign_parts', as: :auto_assign_parts
  post '/start_picking_characters' => 'leads#start_picking_characters', as: :start_picking_characters
  post '/dismiss_unassigned_parts' => 'leads#dismiss_unassigned_parts', as: :dismiss_unassigned_parts
  post '/take_part' => 'parts#create', as: :create_part
  post '/create_group' => 'leads#create', as: :create_lead
  post '/login_group' => 'leads#login', as: :login_lead
  root 'welcome#index'
end
