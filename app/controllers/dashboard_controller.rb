class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
		@juices = current_user.favorites
		@juices = Kaminari.paginate_array(@juices).page(params[:page])
	end

end