class Admin::LoginController < Admin::ApplicationController
	layout "admin/admin_login"
	skip_before_filter :authorize_admin, :only => ['index', 'logout']
	def index
		user_name = params[:user_name]
		user_pass = params[:user_pass]
		user = User.find_by_user_name(user_name)
		if request.post?
			if user && (user.user_pass == user_pass)
				session[:user_id] = user.id
				redirect_to :controller=>"users", :action=>"index"
			else
				flash[:notice] = "用户名或密码错误。"
				redirect_to :action=>"index"
			end
		end
	end
	def logout
		reset_session()
		redirect_to :action=>"index"
	end
end