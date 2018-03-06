class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end
  def create
    @ticket = Ticket.find(params[:ticket_id])
    order  = Order.create!(ticket_id: @ticket.id, amount: @ticket.price, state: 'pending')
    redirect_to new_order_payment_path(order)
  end
end
