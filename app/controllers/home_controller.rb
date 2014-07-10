class HomeController < ApplicationController
	def login
		@home_page = true
		if @current_user != nil
			redirect_to "/mylocations"
		end
	end
end