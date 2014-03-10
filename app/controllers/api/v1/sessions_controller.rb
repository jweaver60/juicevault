class Api::V1::SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :create
	respond_to :json

	def create
		respond_with User.all
	end

end
