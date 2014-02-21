class DashboardController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@juices = current_user.favorites
	end

end