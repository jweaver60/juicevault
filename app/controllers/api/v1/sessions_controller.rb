module Api
	module V1
		class SessionsController < ApplicationController
			skip_before_filter :verify_authenticity_token, :only => :create
			respond_to :json

			def create
    		warden.authenticate!(:scope => :user, :recall => "#{controller_path}#failure")
    		render :status => 200,
           		 :json => { :success => true,
               :info => "Logged in",
               :data => { :auth_token => current_user.authentication_token } }
  		end

  		def destroy
    		warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    		current_user.update_column(:authentication_token, nil)
    		render :status => 200,
           		 :json => { :success => true,
               :info => "Logged out",
               :data => {} }
  		end

  		def failure
    		render :status => 401,
           		 :json => { :success => false,
               :info => "Login Failed",
               :data => {} }
  		end

		end
	end
end