class Api::V1::UsersController < ApplicationController
	before_filter :ensure_user_authenticated
	respond_to :json

	def index
		respond_with User.find_by_authentication_token(params[:auth_token])
	end

	private

	def ensure_user_authenticated
		if params[:auth_token]
			@user = User.find_by_authentication_token(params[:auth_token])
			if @user == nil
				render :status => 401,
							 :json => { :success => false,
							 						:info => 'Unauthorized',
							 						:data => {} }
			else
				@user
			end
		else
			render :status => 401,
						 :json => { :success => false,
						 						:info => 'Unauthorized',
						 						:data => {} }
		end
	end

end