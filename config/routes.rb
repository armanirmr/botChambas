Rails.application.routes.draw do
  get 'commands/create', to: 'commands#create'
  get 'commands/valid_slack_token'
  get 'commands/command_params'
  get 'home/index'
  post 'chambas/create', to: "chambas#create"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 #{} get 'chambas/index', to: 'chambas#index'
  # Defines the root path route ("/")
  root 'home#index'
 
end
