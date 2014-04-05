class Admin::AlbumsController < Admin::ApplicationController
	layout "admin/admin_main"
	before_action :set_album, :only => [:show, :edit, :update, :destroy, :change]
    def index
      @albums = Album.all
    end
    def show
    end
    def new
      @album = Album.new
    end
    def edit
    end

    def create
      @album = Album.new(album_params)
      respond_to do |format|
        if @album.save
          format.html { redirect_to admin_album_path(@album), notice: 'Album save success.' }
        else
          format.html { render action: 'new' }
        end
      end
    end

    def update
      respond_to do |format|
        if @album.update(album_params)
          format.html { redirect_to admin_album_path(@album), :notice => 'Album update success.' }
        else
          format.html { render :action => 'edit' }
        end
      end
    end

    def destroy
      @album.destroy
      redirect_to admin_albums_path
    end
    def change
        status = @album.status? ? '0' : '1'
        @album.update_attribute('status', status)
        redirect_to admin_albums_path
    end
    private
      def set_album
        @album = Album.find(params[:id])
      end
      def album_params
        params.require(:album).permit(:title, :album_photo)
      end
end
