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

# TRIP - MAKE NEW
 get '/new_trip' => 'trips#new'
 post '/new_trip' => 'trips#create'

# TRIP - UPDATE AND DELETE
 get '/trip_update/:id' => 'trips#update'
 get '/trip_delete/:id' => 'trips#delete' 

# SHOW ALL LOCATIONS OF TRIP
 get '/trip_locations/:id' => 'locations#show'
 

# LOCATION - MAKE NEW AND SAVE
 get '/new_location/:id' => 'locations#new'
 post '/create_location/:id' => 'locations#create'


# LOCATION UPDATE SEARCHING
 get '/update_location/:id' => 'locations#update'
 post '/update_location/:id' => 'locations#save'
 




 
end
