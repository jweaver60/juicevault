class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
		@juices = current_user.favorites
		@ratings = current_user.ratings
	end

end