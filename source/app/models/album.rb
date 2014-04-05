class Album < ActiveRecord::Base
	validates_presence_of :title, :message => "Album title can not be blank."
	after_find :format_time
	attr_accessor :created_time

	has_attached_file :album_photo,
				:default_style => :thumb,
				:styles => { :medium => "400x300>", :thumb => "200x150>" ,:large => "800x600>" },
				:url  => "/upload/albums/:id/:style.:extension",
				:path => ":rails_root/public/upload/albums/:id/:style.:extension"
    validates_attachment_content_type :album_photo, :content_type => ['image/jpeg', 'image/png']

	def format_time()
		self.created_time = I18n.l(self.created_at, :format => "%Y-%m-%d")
	end
end
