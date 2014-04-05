class Photo < ActiveRecord::Base
	belongs_to :album
	attr_accessor :created_time
	#validates_presence_of :title, :message => "标题不能为空。"
	after_find :format_time
	has_attached_file :photo_name,
					:default_style => :thumb,
					:styles => { :medium => "400x300>", :thumb => "120x90>" ,:large => "800x600>", :xlarge => "1000x750>" },
					:url  => "/upload/photos/:id/:style.:extension",
					:path => ":rails_root/public/upload/photos/:id/:style.:extension"
    validates_attachment_content_type :photo_name, :content_type => ['image/jpeg', 'image/png']

	def format_time()
		self.created_time = I18n.l(self.created_at, :format => "%Y-%m-%d")
	end
end
