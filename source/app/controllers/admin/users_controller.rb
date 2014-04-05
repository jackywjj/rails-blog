class Admin::UsersController < Admin::ApplicationController
    layout "admin/admin_main"
    before_action :set_user, :only => [:show, :edit, :update, :destroy]
    def index
        @users = User.all
    end
    def show
    end
    def new
        @user = User.new
    end
    def edit
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to admin_user_path(@user), notice: 'User create success.' }
            else
                format.html { render action: 'new' }
            end
        end
    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to admin_user_path(@user), :notice => 'User update' }
            else
                format.html { render :action => 'edit' }
            end
        end
    end

    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to admin_users_path }
        end
    end
    private
        def set_user
            @user = User.find(params[:id])
        end
        def user_params
            params.require(:user).permit(:user_name, :user_pass)
        end
end