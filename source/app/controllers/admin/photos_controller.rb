class Admin::PhotosController < Admin::ApplicationController
	layout "admin/admin_main"
	before_action :set_photo, :only => [:show, :edit, :update, :destroy, :change]
  def index
    @album_id = params[:album_id] ? params[:album_id] : '1'
    @photos = Photo.where("album_id='" + @album_id + "'").order("created_at DESC").paginate(:per_page => 20, :page => params[:page])
  end
  def show
    @album_id = params[:album_id] ? params[:album_id] : '1'
  end
  def new
    @album_id = params[:album_id] ? params[:album_id] : '1'
    @photo = Photo.new
  end
  def edit
    @album_id = params[:album_id] ? params[:album_id] : '1'
  end
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
        if @photo.save
          format.html { redirect_to admin_photos_path(:album_id => @album_id) }
          #format.html { redirect_to admin_photo_path(@photo), notice: '图片新建成功。' }
        else
          format.html { render action: 'new' }
        end
    end
  end
  def update
    respond_to do |format|
        if @photo.update(photo_params)
          format.html { redirect_to admin_photo_path(@photo, :album_id => @photo.album_id), :notice => 'Photo update success.' }
        else
          format.html { render :action => 'edit' }
        end
    end
  end

  def destroy
      @photo.destroy
      redirect_to admin_photos_path
  end
  def change
    @album_id = params[:album_id] ? params[:album_id] : '1'
    status = @photo.status? ? '0' : '1'
    @photo.update_attribute('status', status)
    redirect_to admin_photos_path(:album_id => @album_id)
  end
  private
    def set_photo
      @photo = Photo.find(params[:id])
    end
    def photo_params
    	#logger.debug( params )
      params.require(:photo).permit(:title, :album_id, :photo_name)
    end
end
