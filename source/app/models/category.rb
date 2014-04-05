class Category < ActiveRecord::Base
	validates_presence_of :title, :message => "类型标题不能为空。"
	after_find :format_time
	attr_accessor :created_time

	def format_time()
		self.created_time = I18n.l(self.created_at, :format => "%Y-%m-%d")
	end
end
