class WelcomeController < ApplicationController

	def index
		@recent_users = User.find(:all, :limit => 10, :order => 'created_at DESC')
		@recent_juices = Juice.find(:all, :limit => 10, :order => 'created_at DESC')
	end
	
end
