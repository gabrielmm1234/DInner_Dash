class OrderStatusesController < ApplicationController
  def search_orders
    @order_status = OrderStatus.find(params[:order_status][:name])
    respond_to do |format|
      format.html  {"orders/search"}
      format.json { render json: @order_staus }
  	end
  end
end
