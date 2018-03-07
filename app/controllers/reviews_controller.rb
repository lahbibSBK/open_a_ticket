class ReviewsController < ApplicationController
  before_action :set_ticket, only: [:new, :create]

  def new
    @review = Review.new
    @review.ticket = @ticket
    @review.ticket.status = "closed"
    authorize @review
  end

  def create
     @review = Review.new(review_params)
     @review.ticket = @ticket
     @review.ticket.status = "closed"
     authorize @review
    if @review.save
      redirect_to ticket_path(@ticket), notice: "Your review has successfully been added"
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
