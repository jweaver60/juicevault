class JuicesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@juices = Juice.all
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
			render :new
		end
	end

	def show
		@juice = Juice.find(params[:id])
	end

	private

	def juice_params
    params.require(:juice).permit(:name, :manufacturer, :category, :image_url)
  end

end
