class JuicesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@juices = current_user.juices
	end

	def new
		@juice = Juice.new
	end

	def create
		@juice = Juice.new(juice_params)
		@juice.user_id = current_user.id
		if @juice.save
			redirect_to juices_path
		else
			render "new"
		end
	end

	private

	def juice_params
    params.require(:juice).permit(:name, :manufacturer)
  end

end
