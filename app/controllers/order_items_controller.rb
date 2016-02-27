class OrderItemsController < ApplicationController
  def create
    #bla = OrderItem.new(order_item_params)
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order_item.save
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