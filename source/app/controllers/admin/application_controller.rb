class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery :with => :exception
	before_filter :authorize_admin
	def authorize_admin
		if !session[:user_id]
			redirect_to :controller=>"login", :action=>"index"
		end
	end
end