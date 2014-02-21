class CommentsController < ApplicationController
	before_filter :load_juice

	def create
		@comment = @juice.comments.build(comment_params)
		@comment.juice_id = @juice.id
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to @juice, notice: "Added review"
		else
			render :new
		end
	end

	private

	def load_juice
		@juice = Juice.find(params[:juice_id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end

end
