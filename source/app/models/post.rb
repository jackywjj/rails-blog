include ActionView::Helpers::SanitizeHelper
include ApplicationHelper

class Post < ActiveRecord::Base
 	belongs_to :category
 	attr_accessor :created_time, :content_md
	validates_presence_of :title, :message => "Title can not be blank."
	before_save :reset_model
	after_find :format_time, :format_content
	has_attached_file :post_image,
					:default_style => :thumb,
					:styles => { :medium => "320x240>", :thumb => "120x90>" ,:large => "800x600>" },
					:url  => "/upload/posts/:id/:style.:extension",
					:path => ":rails_root/public/upload/posts/:id/:style.:extension"
    validates_attachment_content_type :post_image, :content_type => ['image/jpeg', 'image/png']

    def reset_model()
    	t = self.created_at.to_s()
    	self.created_month = t[0..6]
    	str = self.content.split('<!--more-->')
    	summary = (str[0]) + '<div class="clearfix"><a href="/blog/' + self.id.to_s + '/" class="pull-right">阅读更多...</a></div>'
    	self.summary = summary.html_safe()
    end
	def format_time()
		return unless self.attribute_present?(:created_at)
		if !self.created_at.nil?
			self.created_time = I18n.l(self.created_at, :format => "%Y-%m-%d")
		end
	end
	def format_content()
		return unless self.attribute_present?(:content)
		if !self.content.nil?
			self.content_md = markdown(self.content)
		end
	end
end
