module Api
	module V1
		class JuicesController < ApplicationController
			respond_to :json

			def index
				respond_with Juice.all
			end

		end
	end
end