class TripsController < ApplicationController
	def new
		@trip_id = params[:id]
	end

	def create
		trip = Trip.new
		@trip_id = trip.id
		trip.trip_name = params[:trip][:trip_name]
		# add user id to trip created
		trip.user = @current_user
		trip.save!
		redirect_to "/mylocations"
	end

	def update
		@trip_id = params[:id]
		trip = Trip.find_by(id: params[:id])
		@trip = trip

		@trip_locations = Location.where(trip_id: @trip_id)
		# maps
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

	def save
		trip = Trip.find_by(id: params[:id])
		trip.trip_name = params[:trip][:trip_name]
		trip.save!

		redirect_to "/mylocations"
	end

	def show
		trip = Trip.find_by(id: params[:id])

	end

	def delete
		# deletes trip and locations associated with trip
		Trip.find_by(id: params[:id]).destroy
		Location.where(trip_id: params[:id]).destroy
		redirect_to "/mylocations" 
	end
end