module JuicesHelper

	def juice_ballot(juice_id)
		if @rating = current_user.ratings.find_by_juice_id(juice_id)
			@rating
		else
			current_user.ratings.new
		end
	end

	def current_user_rating
		if @rating = current_user.ratings.find_by_juice_id(params[:id])
			@rating.value
		else
			"N/A"
		end
	end

	def current_user_ratings(juice_id)
		if @rating = current_user.ratings.find_by_juice_id(juice_id)
			@rating.value
		else
			"N/A"
		end
	end

end
