class Api::V1::UsersController < ApplicationController
	before_filter :ensure_user_authenticated
	respond_to :json

	def index
		@user
	end

	private

	def ensure_user_authenticated
		@user = User.find_by_authentication_token(params[:auth_token])
		if @user
			@user
		else
			render :status => 401,
						 :json => { :success => false,
						 						:info => 'Unauthorized',
						 						:data => {} }
		end
	end

end