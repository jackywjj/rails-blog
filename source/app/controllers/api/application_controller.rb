class Api::ApplicationController < ActionController::Base
	protect_from_forgery :except => :create
end