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
		redirect_to "/new_location/#{@trip_id}"
	end

	# modify this method
	def update
		@trip_id = params[:id]
		trip = Trip.find_by(id: params[:id])
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
		Trip.find_by(id: params[:id]).destroy
		Location.where(trip_id: params[:id]).destroy
		redirect_to "/mylocations" 
	end
end