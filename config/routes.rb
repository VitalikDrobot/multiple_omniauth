Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :create]
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
	get '/auth/failure', to: redirect('/')

end
