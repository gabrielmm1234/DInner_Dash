class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


 	def after_sign_in_path_for(resource)
 		items_path
	end

	def after_sign_out_path_for(resource)
 		items_path
	end

	rescue_from CanCan::AccessDenied do |exception|
    	redirect_to root_url, :alert => exception.message
  	end

  	def clear_danger
    flash[:danger] = nil
  end
end
