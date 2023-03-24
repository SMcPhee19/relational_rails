Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/players', to: 'players#index'
  get '/teams/:id', to: 'teams#show'
  get '/players/:id', to: 'players#show'
  get '/teams/:team_id/players', to: 'team_players#index'
end
