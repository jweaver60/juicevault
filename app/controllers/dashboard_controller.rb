class DashboardController < ApplicationController

	def index
		@juices = current_user.juices
	end

end