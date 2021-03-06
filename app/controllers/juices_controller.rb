class JuicesController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]

	def index
		if params[:search]
			@juices = Juice.where("name ILIKE ? OR manufacturer ILIKE ? OR category ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
			@juices = Kaminari.paginate_array(@juices).page(params[:page]).per(10)
		else
			@juices = Juice.order('created_at DESC').page(params[:page])
		end
	end

	def new
		@juice = Juice.new
	end

	def create
		@juice = Juice.new(juice_params)
		@juice.user_id = current_user.id
		if @juice.save
			current_user.favorites << @juice
			redirect_to juices_path
		else
			render :new
		end
	end

	def show
		@juice = Juice.find(params[:id])
		@comment = Comment.new
	end

	def favorite
		@juice = Juice.find(params[:id])
    type = params[:type]
    if type == "favorite"
    	if current_user.favorites.map(&:id).include?(@juice.id)
    		redirect_to :back, notice: "Already favorited #{@juice.name}"
    	else
      	current_user.favorites << @juice
      	redirect_to :back, notice: "You favorited #{@juice.name}"
      end
    elsif type == "unfavorite"
      current_user.favorites.delete(@juice)
      redirect_to :back, notice: "Unfavorited #{@juice.name}"

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

	private

	def juice_params
    params.require(:juice).permit(:name, :manufacturer, :category, :image_url, :description, :vendor_url)
  end

end
