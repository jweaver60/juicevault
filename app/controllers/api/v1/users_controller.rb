class Api::V1::UsersController < ApplicationController

	respond_to :json

	def index
		respond_with User.find_by_authentication_token(params[:token])
	end

end