class WelcomeController < ApplicationController

	def index
		@recent_users = User.find(:all, :limit => 10, :order => 'created_at DESC')
		if params[:search]
			@recent_juices = Juice.find(:all, :conditions => ['name LIKE ? OR manufacturer LIKE ? OR category LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"])
		else
			@recent_juices = Juice.find(:all, :limit => 10, :order => 'created_at DESC')
		end
	end
	
end
