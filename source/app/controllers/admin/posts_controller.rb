class Admin::PostsController < Admin::ApplicationController
	layout "admin/admin_main"
	before_action :set_post, :only => [:show, :edit, :update, :destroy, :change]
  def index
    @category_id = params[:category_id] ? params[:category_id] : '1'
    @posts = Post.where("category_id='" + @category_id + "'").order("created_at DESC").paginate(:per_page => 20, :page => params[:page])
  end
  def show
    @category_id = params[:category_id] ? params[:category_id] : 1
  end
  def new
    @category_id = params[:category_id] ? params[:category_id] : 1
    @post = Post.new
  end
  def edit
    @category_id = params[:category_id] ? params[:category_id] : '1'
  end

  def create
    @category_id = params[:category_id] ? params[:category_id] : '1'
    @post = Post.new(post_params)
    respond_to do |format|
        if @post.save
          format.html { redirect_to admin_post_path(@post, :category_id => @category_id), notice: 'Essay save success.' }
        else
          format.html { render action: 'new' }
        end
    end
  end

  def update
    #@category_id = params[:category_id] ? params[:category_id] : '1'
    respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to admin_post_path(@post, :category_id => @post.category_id), :notice => 'Essay update success.' }
        else
          format.html { render :action => 'edit', :category_id => @post.category_id }
        end
    end
  end

  def destroy
    category_id = params[:category_id] ? params[:category_id] : '1'
    @post.destroy
    redirect_to admin_posts_path(:category_id => category_id)
  end
  def change
    @category_id = params[:category_id] ? params[:category_id] : '1'
    status = @post.status? ? '0' : '1'
    @post.update_attribute('status', status)
    redirect_to admin_posts_path(:category_id => @category_id)
  end
  private
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
    	logger.debug( params )
      params.require(:post).permit(:title, :content, :category_id, :post_image)
    end
end
