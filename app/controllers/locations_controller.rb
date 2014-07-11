class LocationsController < ApplicationController
	def new
		# pass trip id to form
		@trip_id = params[:id]
	end

	def create
		location = Location.new
		location.address = params[:location][:address]
		location.description = params[:location][:description]
		location.user = @current_user
		location.trip_id = params[:id]
		location.save!
		@location = location
		redirect_to "/update_location/#{location.id}"
	end

# shows searched previous searched coordinates
	def display_searched
		location = Location.find_by(id: params[:id])
		@location_id = location.id
		@trip_id = location.trip_id
		# shows location that was searched
		@hash = Gmaps4rails.build_markers(location) do |location, marker|
  			marker.lat location.to_coordinates[0]
  			marker.lng location.to_coordinates[1]
  			marker.infowindow location.description
  			marker.picture({
          	"url" => "http://i.imgur.com/1OCtNP3.png",
          	"width" =>  36,
          	"height" => 36})
		end
	end

# updates with last search 
	def update
		location = Location.find_by(id: params[:id])
		location.address = params[:location][:address]
		location.description = params[:location][:description]
		location.save!
		redirect_to "/update_location/#{location.id}"
	end

	def save
		redirect_to "/trip_locations/#{params[:id]}"
	end

	def show
		@trip_locations = Location.where(trip_id: params[:id])
		@trip_id = params[:id]
		@trip_name = Trip.find(params[:id]).trip_name
		@hash = Gmaps4rails.build_markers(@trip_locations) do |location, marker|
  			marker.lat location.to_coordinates[0]
  			marker.lng location.to_coordinates[1]
  			marker.infowindow location.description
  			marker.picture({
          	"url" => "http://i.imgur.com/1OCtNP3.png",
          	"width" =>  36,
          	"height" => 36})
		end
	end

	def delete 
		Location.find_by(id: params[:id]).destroy
		redirect_to "/mylocations"
	end

end