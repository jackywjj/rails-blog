class BlogController < ApplicationController
	layout "main_blog"
	def index()
		@posts = Post.all(:conditions => "status='1'", :order => 'created_at DESC')
		@categories = Category.all(:conditions => {:status=>1}, :order => 'id ASC')
		@dates = Post.find_by_sql("SELECT created_month, COUNT(id) as total FROM posts GROUP BY created_month ORDER BY created_month DESC")
	end
	def show()
		@post = Post.find(params[:id])
	end
	def category()
		@posts = Post.all(:conditions => {:status=>1, :category_id=>params[:category_id]}, :order => 'created_at DESC')
		@categories = Category.all(:conditions => {:status=>1}, :order => 'id ASC')
		@dates = Post.find_by_sql("SELECT created_month, COUNT(id) as total FROM posts GROUP BY created_month ORDER BY created_month DESC")
		render("index")
	end
	def archive()
		@posts = Post.all(:conditions => {:status=>1, :created_month=>params[:date]}, :order => 'created_at DESC')
		@categories = Category.all(:conditions => {:status=>1}, :order => 'id ASC')
		@dates = Post.find_by_sql("SELECT created_month, COUNT(id) as total FROM posts GROUP BY created_month ORDER BY created_month DESC")
		render("index")
	end
end
