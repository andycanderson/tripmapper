class LocationsController < ApplicationController
	def new
		@trip_id = params[:id]
	end

	def create
		@trip_id = params[:id]
		location = Location.new
		location.address = params[:location][:address]
		location.description = params[:location][:description]
		location.user = @current_user
		location.trip_id = params[:id]
		location.save!
		
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


	def update
		@location = Location.find_by(id: params[:id])
		location.address = params[:location][:address]
		location.description = params[:location][:description]

	end

	# SUPPOSED TO SHOW SEARCHED LOCATION
	# def mapped
	# 	location = Location.find_by(id: params[:id])
	# 	@current_location = location
	# 	@hash = Gmaps4rails.build_markers(@current_location) do |location, marker|
 #  			marker.lat location.to_coordinates[0]
 #  			marker.lng location.to_coordinates[1]
 #  			marker.infowindow location.description
 #  			marker.picture({
 #          	"url" => "http://i.imgur.com/1OCtNP3.png",
 #          	"width" =>  36,
 #          	"height" => 36})
	# 	end
	# end


	def show
		@trip_locations = Location.where(trip_id: params[:id])
	end

	def delete 

	end

end