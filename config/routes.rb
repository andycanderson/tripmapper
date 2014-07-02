Rails.application.routes.draw do
 get '/' => 'home#login'

 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/logout' => 'sessions#destroy'

 get '/new_user' => 'users#new'
 post '/new_user' => 'users#create'

 get '/mylocations' => 'users#show'
 
end
