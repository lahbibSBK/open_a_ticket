class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end
end
