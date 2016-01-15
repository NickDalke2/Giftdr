Rails.application.routes.draw do
  root 'pages#home'
  post 'persons/:id' => 'persons#create'
  resources :users
  resources :reminders
  resources :sessions
  resources :persons
  delete '/logout' => 'sessions#destroy'
  get 'amazon_api' => 'reminders#amazon_api', as: :amazon_api
  get 'persons/:id/amazon_api' => 'reminders#amazon_api', as: :amazon_api_person
  get '/auth/:provider/callback' => 'sessions#create'
end
