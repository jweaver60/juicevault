class Api::V1::JuicesController < ApplicationController
	respond_to :json

	def index
		respond_with Juice.all
	end

end
