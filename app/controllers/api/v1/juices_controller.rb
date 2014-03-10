class Api::V1::JuicesController < ApplicationController
	respond_to :json

	def index
		respond_with Juice.all
	end

	def show
		respond_with Juice.find(params[:id])
	end
	
end
