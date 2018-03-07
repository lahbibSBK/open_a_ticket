class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
    raise
  end
end
