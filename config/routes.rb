Rails.application.routes.draw do
  resources :groups, only: [:create]

  post '/take_part' => 'parts#create', as: :create_part
  get '/poll_part' => 'parts#poll', as: :poll_part
  post '/pick_character' => 'parts#pick_character', as: :pick_character

  get '/poll_lead' => 'leads#poll', as: :poll_lead
  post '/auto_assign_parts' => 'leads#auto_assign_parts', as: :auto_assign_parts
  post '/allow_self_assign' => 'leads#allow_self_assign', as: :allow_self_assign
  post '/dismiss_parts' => 'leads#dismiss_parts', as: :dismiss_parts
  post '/dismiss_part' => 'leads#dismiss_part', as: :dismiss_part

  post '/create_group' => 'leads#create', as: :create_lead
  post '/login_group' => 'leads#login', as: :login_lead
  root 'welcome#index'
end
