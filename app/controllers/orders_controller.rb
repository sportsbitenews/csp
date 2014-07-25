class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.update_accessors_and_virtual_attributes!(params[:order])
    @order.reload
    set_session @order.id
    render text: @order.logs.pluck(:value)
  end 

  def update
    @order = Order.find params[:id]
    @order.update_accessors_and_virtual_attributes!(params[:order])
    render text: @order.logs.pluck(:value)
  end

end
