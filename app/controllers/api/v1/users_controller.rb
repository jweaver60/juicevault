class Api::V1::UsersController < ApplicationController

	respond_to :json

	def index
		User.find_by_authentication_token(params[:token])
	end
	
end