class Admin::CategoriesController < Admin::ApplicationController
	layout "admin/admin_main"
	before_action :set_category, :only => [:show, :edit, :update, :destroy, :change]
    def index
        @categories = Category.all
    end
    def show
    end
    def new
        @category = Category.new
    end
    def edit
    end

    def create
        @category = Category.new(category_params)
        respond_to do |format|
            if @category.save
                format.html { redirect_to admin_category_path(@category), notice: 'Category save success.' }
            else
                format.html { render action: 'new' }
            end
        end
    end

    def update
        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to admin_category_path(@category), :notice => 'Category update success.' }
            else
                format.html { render :action => 'edit' }
            end
        end
    end

    def destroy
        @category.destroy
        redirect_to admin_categories_path
    end
    def change
        status = @category.status? ? '0' : '1'
        @category.update_attribute('status', status)
        redirect_to admin_categories_path
    end
    private
        def set_category
            @category = Category.find(params[:id])
        end
        def category_params
            params.require(:category).permit(:title)
        end
end
