class UsersController < ApplicationController
	def new
	end

	def create
		user = User.new
		user.email = params[:user][:email]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_confirmation]
		user.save!
		# saves user id to session
		session[:user_id] = user.id.to_s
		redirect_to "/mylocations"
	end

	def show

		@user = User.find_by(params[:id])
		# uses id stored in session in form of bson
		@users_trips = Trip.where(user_id: @current_user.id)

		# change so only gets user's locations
		@all_locations = Location.all
		@hash = Gmaps4rails.build_markers(@all_locations) do |location, marker|
  			marker.lat location.to_coordinates[0]
  			marker.lng location.to_coordinates[1]
  			marker.infowindow location.description
  			marker.picture({
          	"url" => "http://i.imgur.com/1OCtNP3.png",
          	"width" =>  36,
          	"height" => 36})
		end
	end

end