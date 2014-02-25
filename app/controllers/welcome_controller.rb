class WelcomeController < ApplicationController

	def index
		@juices = Juice.last(4)
	end
	
end
