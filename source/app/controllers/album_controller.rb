class AlbumController < ApplicationController
	layout "main_album"
	def index()
		@albums = Album.all()
		album_id = params[:id] ? params[:id] : @albums[0]
		@album = Album.find(album_id)
		@photos = Photo.all(:conditions => {:album_id => album_id})
	end
end
