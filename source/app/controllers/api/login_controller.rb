class Api::LoginController < Api::ApplicationController
    skip_before_action :verify_authenticity_token
	def index
        
        user_name = params[:user_name] ? params[:user_name] : '';
        user_pass = params[:user_pass] ? params[:user_pass] : ''
        if (user_name == "ycw" && user_pass == "ycw")
            render :json => { :status => 200, :token => 'abc123'}
        else
            render :json => { :status => 400, :token => ''}
        end
	end
	def logout
	end
end