class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      order = Order.find(session[:order_id])
    else
      if user_signed_in?
        Order.new(user_id:current_user.id)
      else
        Order.new()
      end
    end
  end

 	def after_sign_in_path_for(resource)
    if !session[:order_id].nil?
      @order = Order.find(session[:order_id])
      @order.user_id = current_user.id
      @order.save
    end
 		'/home'
	end

	def after_sign_out_path_for(resource)
 		'/home'
	end

	rescue_from CanCan::AccessDenied do |exception|
    	redirect_to root_url, :alert => exception.message
  	end

  	def clear_danger
    flash[:danger] = nil
  end
end
