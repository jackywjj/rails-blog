class User < ActiveRecord::Base
	validates_presence_of :user_name, :message => "User name can not be blank."
	validates_presence_of :user_pass, :message => "User password can not be blank."
end