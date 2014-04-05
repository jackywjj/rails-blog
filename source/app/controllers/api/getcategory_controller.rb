class Api::GetcategoryController < Api::ApplicationController
    skip_before_action :verify_authenticity_token
	def index
    categories = Category.all
    if categories.nil?
      render :json => { :return_code => 400, :categories => ''}
    else
      render :json => { :return_code => 200, :categories => categories}
    end
	end
end