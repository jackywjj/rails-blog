class RssController < ApplicationController
	def index()
		#content_type :rss
	    #@posts = Post.all(:select => "title, id, content, created_at", :order => "created_at DESC", :limit => 20) 
	    @posts = Post.all(:order => "created_at DESC", :limit => 20) 
	    respond_to do |format|
			format.rss { render :layout => false }
			#format.html { render :layout => false }
			#render('index', :layout => false)
	    end
	end
end