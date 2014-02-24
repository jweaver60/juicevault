module JuicesHelper

	def juice_ballot(juice)
		if @rating = current_user.ratings.find_by_juice_id(juice.id)
			@rating
		else
			current_user.ratings.new
		end
	end

	def current_user_rating(juice)
		if @rating = current_user.ratings.find_by_juice_id(juice.id)
			@rating.value
		else
			"N/A"
		end
	end

end
