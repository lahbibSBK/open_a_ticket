class PaymentsController < ApplicationController
  before_action :set_order

  def new
    @ticket = @order.ticket
    @mentor = @ticket.mentor
    @ticket.status = "pending"
    @ticket.save
  end

  def create
    @ticket = @order.ticket
    @amount = @order.amount_cents
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents,
      description:  "Payment for Ticket #{@order.ticket_id} for order #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')
    @ticket.status = "pending"
    @ticket.save
    redirect_to ticket_path(@ticket)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)

  end

  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
