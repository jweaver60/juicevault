class RatingsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@juice = Juice.find_by_id(params[:juice_id])
		@rating = Rating.new(rating_params)
		@rating.user_id = current_user.id
		@rating.juice_id = @juice.id
		if @rating.save
			respond_to do |format|
				format.html { redirect_to juice_path(@juice), :notice => "Your rating has been saved." }
				format.js
			end
		end
	end

	def update
		@juice = Juice.find_by_id(params[:juice_id])
		@rating = current_user.ratings.find_by_juice_id(@juice.id)
		if @rating.update_attributes(rating_params)
			respond_to do |format|
				format.html { redirect_to juice_path(@juice), :notice => "Your rating has been updated" }
				format.js
			end
		end
	end

	private

	def rating_params
		params.require(:rating).permit(:value)
	end

end