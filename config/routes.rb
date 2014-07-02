Rails.application.routes.draw do
 get '/' => 'home#login'

# LOGIN OR OUT
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/logout' => 'sessions#destroy'

# NEW USER
 get '/new_user' => 'users#new'
 post '/new_user' => 'users#create'

 # LANDING PAGE FOR LOGGED IN USERS
 get '/mylocations' => 'users#show'

# MAKE NEW TRIP
 get '/new_trip' => 'trip#new'
 post '/new_trip' => 'trip#create'

# MAKE NEW LOCATION
 get '/new_location' => 'location#new'
 post '/new_location' => 'location#create'


 
end
