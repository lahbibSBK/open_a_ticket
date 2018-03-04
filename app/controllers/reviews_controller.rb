class ReviewsController < ApplicationController
  before_action :set_ticket, only: [:new, :create]

  def new
    @review = Review.new
    @review.ticket = @ticket
    @review.ticket.status = "closed"
    authorize @review
    #le redirect pose problème avec pundit
    redirect_to ticket_path(@ticket)
  end

  def create
     @review = Review.new(review_params)
     @review.ticket = @ticket
     @review.ticket.status = "closed"
     authorize @review
    if @review.save
      redirect_to ticket_path(@review.ticket)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
