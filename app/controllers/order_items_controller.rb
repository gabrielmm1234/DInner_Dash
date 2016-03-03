class OrderItemsController < ApplicationController
  def create
    @order = current_order
    params = order_item_params
    @order_item = @order.order_items.find_by(item_id: params[:item_id])
    unless @order_item
      @order_item = @order.order_items.new(params)
      @order_item.save
    else
      @order_item.update(quantity: @order_item.quantity + params[:quantity].to_i)
    end
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id,:unit_price)
  end
end
